# Description:
#   A way to annoy Nate.
#
# Commands:
#   hubot @natez0r me <query> - Queries Google Images for <query> and tweets a random result at Nate.

Duration = require 'duration'
Twitter = require 'twit'

module.exports = (robot) ->
  robot.hear /@natez0r(?: me)? (.*)/i, (msg) ->
    try
      query = msg.match[1]
      nate.annoy robot, query, (url) ->
        msg.send url
    catch error
      msg.send error

class Annoyance
  constructor: (robot, username, query) ->
    @robot = robot
    @username = username
    @query = query
    @twitter = new Twitter
      consumer_key: process.env.TWITTER_CONSUMER_KEY
      consumer_secret: process.env.TWITTER_CONSUMER_SECRET
      access_token: process.env.TWITTER_ACCESS_TOKEN_KEY
      access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET

  image: (callback) ->
    @robot.imageMe @query, callback

  status: (url) ->
    "hey @#{@username}, enjoy some #{@query}! #{url}"

  tweet: (callback) ->
    @image (url) =>
      params =
        status: @status url
      @twitter.post 'statuses/update', params, (error, tweet) ->
        raise "Error: #{error[0].message} (code #{error[0].code})" if error
        callback "http://twitter.com/#{tweet.user.screen_name}/status/#{tweet.id_str}"

class Nate
  constructor: (username) ->
    @username = username || 'natez0r'
    @limiter = new NateLimiter()

  annoy: (robot, query, callback) ->
    if @limiter.annoyable()
      new Annoyance(robot, @username, query).tweet (url) =>
        @limiter.reset()
        callback url
    else
      throw @limiter.error query

class NateLimiter
  constructor: (period) ->
    @period = period || 21600000 # 6 hours

  annoyable: ->
    @last is undefined or (Date.now() - @last.getTime()) > @period

  error: (query) ->
    console.log @next()
    duration = new Duration new Date(), @next()
    "Even Nate has feelings. Please wait another #{duration.toString 1, 2} before annoying him " +
      "about #{query}!"

  next: ->
    new Date @last.getTime() + @period

  reset: ->
    @last = new Date()

nate = new Nate
