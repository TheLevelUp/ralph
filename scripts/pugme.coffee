# Description:
#   Pugme is the most important thing in life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot pug me - Receive a pug
#   hubot pug bomb N - get N pugs

module.exports = (robot) ->
  pugArray = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Mops_555.jpg/418px-Mops_555.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Pug_wearing_a_hat.JPG/401px-Pug_wearing_a_hat.JPG',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Sad-pug.jpg/640px-Sad-pug.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Pug_dog_nose_face_detail.JPG/640px-Pug_dog_nose_face_detail.JPG',
    'https://upload.wikimedia.org/wikipedia/commons/4/48/Mopshond2_03-10-2005.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Bonny_Bonita.JPG/640px-Bonny_Bonita.JPG'
  ]

  robot.respond /pug me/i, (msg) ->
    msg.send pugArray[Math.floor(Math.random()*pugArray.length)]

  robot.respond /pug bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 3
    msg.send pug for pug in pugArray.slice(0, count)

  robot.respond /how many pugs are there/i, (msg) ->
    msg.send "There are #{pugArray.length} pugs."

