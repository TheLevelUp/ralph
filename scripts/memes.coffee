# Description:
#   Displays images in response to certain regular expressions
# Commands:
#   aribot - for when you want approval
#   babers way - the most delicious way
#   hubot enhance - for when you want to enhance
#   hop on - you're gonna get some hop ons
#   hubot i don't even - neil degrasse tyson is excited
#   hubot it's happening - ron paul is excited
#   hubot taco town
#   hubot torture a kitten
#   hubot unix - when you know unix
#   what do we want - for when we want brains
#   when do we want it - for when we want brains

module.exports = (robot) ->
  robot.hear /aribot/i, (msg) ->
    msg.send 'http://i.imgur.com/vQja8jB.jpg'

  robot.hear /\bbaber'?s\s?way\b/i, (msg) ->
    msg.send 'http://i.imgur.com/rIC8Vuc.gif'

  robot.hear /bee+s?\b/i, (message) ->
    if Math.random() <= 0.05
      message.send "http://i.imgur.com/qrLEV.gif"

  robot.hear /da+yum/i, (msg) ->
    msg.send 'http://i.imgur.com/vu0AC4m.gif'

  robot.respond /\benhance\b/i, (msg) ->
    msg.send 'https://media.giphy.com/media/3ohc14lCEdXHSpnnSU/giphy.gif'

  robot.hear /follow your dreams/i, (msg) ->
    msg.send 'http://i.chzbgr.com/maxW500/7085726208/h2DE3C7F0.gif'

  robot.hear /head explode|mind blown/i, (msg) ->
    msg.send 'http://www.reactiongifs.com/r/2011/09/mind_blown.gif'

  robot.hear /hop\s?on/i, (msg) ->
    msg.send 'https://media.giphy.com/media/3aZL9ajHATskT8HpRs/giphy.gif'

  robot.respond /i don't even/i, (msg) ->
    msg.send 'http://i3.kym-cdn.com/photos/images/newsfeed/000/198/010/tysonreaction.gif'

  robot.respond  /it's happening/i, (msg) ->
    msg.send 'http://1.bp.blogspot.com/-vpE6uMJ37dk/UOScrne47aI/AAAAAAAAEL4/Ki-4IWO-SoY/s1600/ron-paul.gif'

  robot.hear /lunch is here/i, (msg) ->
    msg.send 'https://i.chzbgr.com/maxW500/7565889280/h1F3B738A.gif'

  robot.hear /magic word/i, (msg) ->
    msg.send 'http://24.media.tumblr.com/8566ef54aefe210f0706b8768a62ff5c/tumblr_mldilmBIxz1r7rimro1_400.gif'

  robot.hear /pull yourself together/i, (msg) ->
    msg.send 'http://i.imgur.com/JNrl4.gif'

  robot.respond /taco town/i, (msg) ->
    msg.send 'http://i.imgur.com/nVZ9mug.gif'

  robot.respond /torture .* kitten/i, (msg) ->
    msg.send 'http://awesomegifs.com/wp-content/uploads/kitten-mittens-always-sunny.gif'

  robot.hear /unix/i, (msg) ->
    msg.send 'http://stuff.ebnj.net/funny/jurassicunix.gif'

  robot.hear /^(what do we want|when do we want it)/i, (msg) ->
    msg.send 'BRAINS'

  robot.respond /what's for lunch/i, (msg) ->
    msg.send 'https://docs.google.com/spreadsheets/d/1M-qV4-FBUfQELJaB-gfJ8lfpJQYPlTHeRP4aJZ0Urg8'
