# Description:
#   Finds Ross.
#

BASE_URL = 'http://odyssey.rosspaffett.com'
POLL_INTERVAL_MINS = 10
ROOM = 'pm-with:ari@scvngr.com'

cheerio = require 'cheerio'
sys = require 'sys'

module.exports = (robot) ->
  callback = ->
    robot.http(BASE_URL + '/posts').get() (err, res, body) ->
      $ = cheerio.load(body)
      location = $('.post-header strong').eq(1).text()
      link = BASE_URL + $('a.post-link').first().attr('href')
      picture = $('a.post-link img').first().attr('src')
       
      if robot.brain.data.rosslink isnt link
        robot.brain.data.rosslink = link
        robot.send {room: ROOM}, "Ross has arrived in #{location} #{link} #{picture}"

  callback()
  setInterval callback, POLL_INTERVAL_MINS * 60 * 1000
