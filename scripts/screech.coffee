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
  screeches = [
    'https://imgur.com/H9HgG0t.jpg',
    'https://imgur.com/5rMknuM.jpg',
    'https://imgur.com/DC8gDBu.jpg',
    'https://imgur.com/yfEw7GQ.jpg',
    'https://imgur.com/ZKCEgpr.jpg',
    'https://imgur.com/CtduXH5.jpg',
    'https://imgur.com/FAiK4Vs.jpg'
  ]

  robot.respond /screech/i, (msg) ->
    msg.send screeches[Math.floor(Math.random()*screeches.length)]
