# Description:
#   moonface memes
# Commands:
#   hubot moonface - Retuns a moonface image
module.exports = (robot) ->
  robot.respond /moonface/i, (msg) ->
    moonfaces = [
      'http://www.cottagesandgardens.com/images/bonnies-boardwalk-originals/moon_face_16196_16197_bonnies_boardwalk_originals_markley_440.jpg',
      'https://thegraphicsfairy.com/wp-content/uploads/blogger/_CarNcodpCMA/TAru5X-sUlI/AAAAAAAAH0Y/UV9mb1POjwg/s1600/moon-graphicsfairy004c.jpg',
      'http://www.paperrelics.com/besottment/free-downloads/fullsize/moonface-paperrelics.jpg',
      'https://pbs.twimg.com/profile_images/378800000007491109/60cd1261279465d1f2876bc79dd66f6b.jpeg',
      'http://www.rugstudio.net/files/productimages/american_dakota/s_moon_face_endurastran.jpg',
      'https://thegraphicsfairy.com/wp-content/uploads/blogger/-ln8zV9pnAuI/T9aLUQRyu9I/AAAAAAAASQQ/DKl-_dax3CY/s1600/MoonMan-Vintage-GraphicsFairy3.jpg',
      'http://img2.etsystatic.com/000/0/6502511/il_fullxfull.339264842.jpg',
      'https://thegraphicsfairy.com/wp-content/uploads/2013/10/Vintage-Moon-Man-Image-GraphicsFairy.jpg',
      'https://thegraphicsfairy.com/wp-content/uploads/2012/10/MoonManHappy-GraphicsFairy1.jpg',
      'https://thegraphicsfairy.com/wp-content/uploads/blogger/-JsATCo3Mkgw/T9aLQ9e7guI/AAAAAAAASQI/NSAq2GSKGT4/s1600/MoonMan-Vintage-GraphicsFairy2.jpg',
      'http://c300221.r21.cf1.rackcdn.com/the-moon-face-1345337751_b.jpg',
      'https://junkthief.files.wordpress.com/2012/01/moon-face1.jpg'
    ]

    msg.send msg.random moonfaces

