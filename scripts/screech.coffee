# Description:
#   Screech is the most important thing in life.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot screech - Receive a screech

module.exports = (robot) ->
  screechArray = [
    'https://imgur.com/H9HgG0t.jpg',
    'https://imgur.com/5rMknuM.jpg',
    'https://imgur.com/DC8gDBu.jpg',
    'https://imgur.com/DC8gDBu.jpg',
    'https://imgur.com/yfEw7GQ.jpg'
  ]

  robot.respond /screech/i, (msg) ->
    msg.send screechArray[Math.floor(Math.random()*screechArray.length)]
