# Description
#   random cat gifs as a service for your cat gif driven development
#   source for the service: https://github.com/flores/moarcats
#   most of the below is lifted from corgime.coffee
#   (taken from github/hubot-scripts/src/scripts/moarcatsme.coffee)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cat me - links http://edgecats.net, which serves a random cat gif
#   hubot cat bomb <n> - gives <n> cat gifs
#
# Author:
#   flores

module.exports = (robot) ->
  robot.respond /cat me/i, (msg) ->
    msg.http("http://edgecats.net/random").get() (err, res, body) ->
      msg.send body

  robot.respond /cat bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 2
    for cat in [1..count]
      msg.http("http://edgecats.net/random")
        .get() (err, res, body) ->
          msg.send body
