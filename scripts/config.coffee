# Description:
#   Serious business of setting env varz
#
# Commands:
#   hubot config me - replies with a link to the ENV var doc

module.exports = (robot) ->
  robot.respond /config me/i, (msg) ->
    msg.send "https://github.com/TheLevelUp/guides/blob/master/platform/ops-environment-variables.md"
