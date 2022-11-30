# Description:
#   Ralph tells a joke
#
# Dependencies:
#    none
#
# Configuration:
#   None
#
# Commands:
#    ralph tell me a joke
#
# Notes:
#    None
#
# Author:
#    @km42levelup

module.exports = (robot) ->
  robot.respond /tell me a joke/i, (msg) ->
    msg.send 'knock knock'
