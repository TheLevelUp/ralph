# Description:
#   Failed 90s technologies
# Commands:
#   hubot the future - Returns an image from the future
module.exports = (robot) ->
  robot.respond /(teh|the) +(futar|future)/i, (msg) ->
    images = [
      'http://www.orchidpalms.com/polyhedra/hedron_vrml.gif',
      'http://upload.wikimedia.org/wikipedia/commons/9/96/Iomega-100-Zip-Drive.jpg',
      'http://www.mactech.com/articles/mactech/Vol.12/12.11/JavaGrids/img003.gif',
      'http://upload.wikimedia.org/wikipedia/en/6/62/MsComicChat.png',
      'http://freewarewiki.com/f/msBob.jpg',
      'http://stayornay.com/tech/wp-content/uploads/2010/07/LaserDisc-DVD-Sizes-web.jpg',
      'http://netdna.webdesignerdepot.com/uploads/2009/01/newton.jpg',
      'http://distilleryimage2.ak.instagram.com/083fe09c405711e3bb0822000a1fbacd_8.jpg'
    ]

    msg.send msg.random images
