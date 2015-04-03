# Description:
#   Displays images in response to certain regular expressions
# Commands:
#   aribot - for when you want approval
#   babers way - the most delicious way
#   hubot capybara - like pug bomb. for capybaras.
#   hop on - you're gonna get some hop ons
#   it's happening - ron paul is excited
#   linux - RMSifies you
#   hug|touch - no touching
#   what do we want - for when we want brains
#   when do we want it - for when we want brains

module.exports = (robot) ->
  robot.hear /aribot/i, (msg) ->
    console.log msg
    msg.send 'http://i.imgur.com/vQja8jB.jpg'

  robot.hear /\bbaber'?s\s?way\b/i, (msg) ->
    msg.send 'http://i.imgur.com/rIC8Vuc.gif'

  robot.hear /bucks|money/i, (msg) ->
    msg.send 'http://stuff.ebnj.net/funny/moneygun.gif'

  robot.respond /capybara/i, (msg) ->
    imageMe msg, 'capybara', (url) ->
      msg.send url

  robot.hear /da+yum/i, (msg) ->
    msg.send 'http://fc09.deviantart.net/fs71/f/2012/258/8/2/dayum_dayum_dayum___by_mystic_dranomimon-d5erzlw.gif'

  robot.hear /\benhance\b/i, (msg) ->
    msg.send 'http://stream1.gifsoup.com/view1/2373799/enhance-o.gif'

  robot.hear /follow your dreams/i, (msg) ->
    msg.send 'http://i.chzbgr.com/maxW500/7085726208/h2DE3C7F0.gif'

  robot.hear /head explode|mind blown/i, (msg) ->
    msg.send 'http://www.reactiongifs.com/r/2011/09/mind_blown.gif'

  robot.hear /hop\s?on/i, (msg) ->
    msg.send 'http://blog.zap2it.com/frominsidethebox/arrested-development-s01e05-visiting-ours.gif'

  robot.hear /hug\b|touch/i, (msg) ->
    msg.send 'http://25.media.tumblr.com/tumblr_mb5b9iejUE1rbhrb1o1_500.gif'

  robot.hear /i don't even/i, (msg) ->
    msg.send 'http://i3.kym-cdn.com/photos/images/newsfeed/000/198/010/tysonreaction.gif'

  robot.hear /it's happening/i, (msg) ->
    msg.send 'http://1.bp.blogspot.com/-vpE6uMJ37dk/UOScrne47aI/AAAAAAAAEL4/Ki-4IWO-SoY/s1600/ron-paul.gif'

  robot.hear /lunch is here/i, (msg) ->
    msg.send 'https://i.chzbgr.com/maxW500/7565889280/h1F3B738A/#.gif'

  robot.hear /\slinux\b/i, (msg) ->
    msg.send 'http://i.imgur.com/DXUgvy8.jpg'

  robot.hear /magic word/i, (msg) ->
    msg.send 'http://24.media.tumblr.com/8566ef54aefe210f0706b8768a62ff5c/tumblr_mldilmBIxz1r7rimro1_400.gif'

  robot.hear /\bmountain bomb\b/i, (msg) ->
    mountainMe msg

  robot.hear /pull yourself together/i, (msg) ->
    msg.send 'http://i.imgur.com/JNrl4.gif'

  robot.respond /taco town/i, (msg) ->
    msg.send 'http://i848.photobucket.com/albums/ab49/iamfilthy/taco_town.gif'

  robot.respond /torture .* kitten/i, (msg) ->
    msg.send 'http://awesomegifs.com/wp-content/uploads/kitten-mittens-always-sunny.gif'

  robot.hear /unix/i, (msg) ->
    msg.send 'http://stuff.ebnj.net/funny/jurassicunix.gif'

  robot.hear /^(what do we want|when do we want it)/i, (msg) ->
    msg.send 'BRAINS'

  robot.respond /what's for lunch/i, (msg) ->
    msg.send 'https://drive.google.com/open?id=0Ahnoxd3OzgVsdEJpUEhNTFpMQWFaU1p5RTZPZFE1eEE'

# Stolen from google-images.coffee
imageMe = (msg, query, animated, faces, cb) ->
  cb = animated if typeof animated == 'function'
  cb = faces if typeof faces == 'function'
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  q.imgtype = 'animated' if typeof animated is 'boolean' and animated is true
  q.imgtype = 'face' if typeof faces is 'boolean' and faces is true
  msg.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        image  = msg.random images
        cb "#{image.unescapedUrl}#.png"
      else
        console.log 'imageMe failure: ' + body

mountainMe = (msg) ->
  mountains = ['annapurna', 'cho oyu', 'denali', 'eiger north face', 'everest', 'gasherbrum',
    'k2', 'kangchenjunga', 'lhotse', 'makalu', 'matterhorn', 'mont blanc massif', 'nanga parbat',
    'shishapangma', 'washington']
  mountain = msg.random mountains
  imageMe msg, "#{mountain} mountain", (url) ->
    msg.send url
