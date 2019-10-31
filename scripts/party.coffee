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
#    hubot party <emoji> <emoji> WxH - ralph parties with your two emoji in a W by H rectangle.
#
# Notes:
#    None
#
# Author:
#    @km42levelup

DEFAULT_WIDTH = 12

DEFAULT_HEIGHT = 6

party = (emoji_one, emoji_two, width, height) ->
  line_one = Array(Math.floor(width / 2) + 1).join(emoji_one + emoji_two)
  if ((width % 2) == 1)
    line_one += emoji_one

  line_two = Array(Math.floor(width / 2) + 1).join(emoji_two + emoji_one)
  if ((width % 2) == 1)
    line_two += emoji_two

  paragraph = ''
  i = 0
  while i < height
    if ((i % 2) == 0)
      paragraph += line_one + '\n'
    else
      paragraph += line_two + '\n'
    i++
  return paragraph


module.exports = (robot) ->
  robot.respond /party\s+(\S+)\s+(\S+)(\s+[\d]+x[\d]+$)?/i, (msg) ->
    emoji_one = msg.match[1]
    emoji_two = msg.match[2]
    width = DEFAULT_WIDTH
    height = DEFAULT_HEIGHT
    if (msg.match[3] != undefined)
      corrected = msg.match[3].trim()
      idx_x = corrected.indexOf('x')
      width = parseInt(corrected.substr(0, idx_x))
      height = parseInt(corrected.substr(idx_x + 1, corrected.length - idx_x - 1))
    msg.send party(emoji_one, emoji_two, width, height)
