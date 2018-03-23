# Description:
#   Thonk is love. Thonk is life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot thonk me - Receive a thonk
#   hubot thonk bomb N - get N thonks

module.exports = (robot) ->
  thonkArray = [
    'https://i.redd.it/7geba60hr0e01.jpg',
    'http://i0.kym-cdn.com/photos/images/original/001/279/809/172.gif',
    'https://i.imgur.com/zXAA3CV.gif',
    'https://i.imgur.com/hlP0Brh.gif',
    'https://i.imgur.com/8cLO9So.gif',
    'https://i.imgur.com/T4sr6vD.png',
    'https://i.imgur.com/Y2d8wE7.jpg'
  ]

  robot.respond /thonk me/i, (msg) ->
    msg.send thonkArray[Math.floor(Math.random()*thonkArray.length)]

  robot.respond /thonk bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 3
    msg.send thonk for thonk in thonkArray.slice(0, count)
