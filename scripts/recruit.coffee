# Description:
#   gets random tweet from @erowidrecruiter
#   based on https://github.com/github/hubot-scripts/blob/master/src/scripts/twitter.coffee
#
# Dependencies:
#   "twit": "1.1.6"
#   "underscore": "1.4.4"
#
# Configuration:
#   HUBOT_TWITTER_CONSUMER_KEY
#   HUBOT_TWITTER_CONSUMER_SECRET
#   HUBOT_TWITTER_ACCESS_TOKEN
#   HUBOT_TWITTER_ACCESS_TOKEN_SECRET
#
# Commands:
#   hubot recruit [me] - Tries to recruit you
#
# Author:
#   KevinTraver
#

_ = require "underscore"
Twit = require "twit"
config =
  consumer_key: process.env.TWITTER_CONSUMER_KEY
  consumer_secret: process.env.TWITTER_CONSUMER_SECRET
  access_token: process.env.TWITTER_ACCESS_TOKEN_KEY
  access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET

module.exports = (robot) ->
  twit = undefined

  robot.respond /recruit( me)?/i, (msg) ->
    unless config.consumer_key
      msg.send "Please set the TWITTER_CONSUMER_KEY environment variable."
      return
    unless config.consumer_secret
      msg.send "Please set the TWITTER_CONSUMER_SECRET environment variable."
      return
    unless config.access_token
      msg.send "Please set the TWITTER_ACCESS_TOKEN environment variable."
      return
    unless config.access_token_secret
      msg.send "Please set the TWITTER_ACCESS_TOKEN_SECRET environment variable."
      return

    unless twit
      twit = new Twit config

    twit.get "statuses/user_timeline",
      screen_name: 'erowidrecruiter'
      count: Math.floor(Math.random() * 150) + 1
      include_rts: false
      exclude_replies: true
    , (err, reply) ->
      return msg.send "Error" if err
      return msg.send _.unescape(_.last(reply)['text']) if reply[0]['text']
