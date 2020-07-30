# Description:
#   Momo is the most important thing in life
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot momo me - Receive a Momo
#   hubot momo bomb N - get N Momos

module.exports = (robot) ->
  momoArray = [
    'https://s3.amazonaws.com/www.momobot.net/momo/DSC_0066.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_1314.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_2199.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/Photo%20Oct%2023,%203%2046%2055%20PM.jpg',
    'https://s3.amazonaws.com/www.momobot.net/momo/Photo_Nov_09,_6_05_44_PM.jpg',
    'https://s3.amazonaws.com/www.momobot.net/momo/k_IMG_4361.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/k_IMG_1812.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_0331.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/2013-08-12_20.02.37.jpg',
    'https://s3.amazonaws.com/www.momobot.net/momo/2013-08-12_20.11.25.jpg',
    'https://s3.amazonaws.com/www.momobot.net/momo/2013-08-17_16.33.37.jpg',
    'https://s3.amazonaws.com/www.momobot.net/momo/2013-09-01_08.06.52.jpg',
    'https://s3.amazonaws.com/www.momobot.net/momo/2013-08-19_07.08.28.jpg',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_0300.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_1427.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_0511.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_0863.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_1624.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/IMG_2123.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/k_IMG_2203.JPG',
    'https://s3.amazonaws.com/www.momobot.net/momo/Photo_May_23,_1_33_25_AM.jpg'
  ]

  robot.respond /momo me/i, (msg) ->
    msg.send momoArray[Math.floor(Math.random()*momoArray.length)]

  robot.respond /momo bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 3
    msg.send momo for momo in momoArray.slice(0, count)

  robot.respond /how many momos are there/i, (msg) ->
    msg.send "There are #{momoArray.length} momos."
