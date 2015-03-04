# Description:
#   SCREAMING ON THE INTERNET MADE EASY.
#
# Commands:
#   hubot shout <query> - SHOUTS <QUERY> BACK AT YOU.

module.exports = (robot) ->
  robot.respond /shout(?: me)?\s+(.*)/i, (msg) ->
    msg.send msg.match[1].toUpperCase()
