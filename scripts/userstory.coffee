# Description:
#   gets random tweet from @GoatUserStory
#   based on https://github.com/github/hubot-scripts/blob/master/src/scripts/twitter.coffee
#
# Dependencies:
#   "twit", "underscore"
#
# Configuration:
#   HUBOT_TWITTER_CONSUMER_KEY
#   HUBOT_TWITTER_CONSUMER_SECRET
#   HUBOT_TWITTER_ACCESS_TOKEN
#   HUBOT_TWITTER_ACCESS_TOKEN_SECRET
#
# Commands:
#   hubot <ticket|user story> - Gives you a useful user story to implement
#
# Author:
#   KevinTraver
#

screen_name = "GoatUserStories"
_ = require "underscore"
Twit = require "twit"
config =
  consumer_key: process.env.TWITTER_CONSUMER_KEY
  consumer_secret: process.env.TWITTER_CONSUMER_SECRET
  access_token: process.env.TWITTER_ACCESS_TOKEN_KEY
  access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET

module.exports = (robot) ->
  twit = undefined

  robot.respond /ticket|user story/i, (msg) ->
    unless config.consumer_key
      msg.reply "Please set the TWITTER_CONSUMER_KEY environment variable."
      return
    unless config.consumer_secret
      msg.reply "Please set the TWITTER_CONSUMER_SECRET environment variable."
      return
    unless config.access_token
      msg.reply "Please set the TWITTER_ACCESS_TOKEN environment variable."
      return
    unless config.access_token_secret
      msg.reply "Please set the TWITTER_ACCESS_TOKEN_SECRET environment variable."
      return

    unless twit
      twit = new Twit config

    twit.get "statuses/user_timeline",
      screen_name: screen_name
      count: Math.floor(Math.random() * 150) + 1
      include_rts: false
      exclude_replies: true
    , (err, reply) ->
      return msg.reply "Error" if err
      return msg.reply "https://twitter.com/#{screen_name}/status/#{_.last(reply)['id_str']}" if reply[0]['id_str']
