# Description:
#   Parties with two emoji
#
# Dependencies:
#    none
#
# Configuration:
#   None
#
# Commands:
#    hubot party <emoji> <emoji> - ralph parties with your two emoji
#
# Notes:
#    None
#
# Author:
#    @km42

party = ":a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a:

:b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b:

:a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a:

:b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b:

:a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a:

:b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b:

:a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a:

:b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b:

:a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a:

:b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b: :a: :b:"

module.exports = (robot) ->
    robot.respond /party ([^\ ]+) ([^\ ]+)/i, (msg) ->
        emoji_one = msg.match[1]
        emoji_two = msg.match[2]
        msg.send party.replace(/:a:/g, emoji_one).replace(/:b:/g, emoji_two)
        