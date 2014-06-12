# Description:
#   Brings SA emoticons out of the forum and into the chat
module.exports = (robot) ->
  robot.hear /:(\w+):/i, (msg) ->
    emote = msg.match[1]
    url = "http://sae.tweek.us/media/emoticons/emot-#{emote}.gif"
    robot.http(url)
      .get() (err, res, body) ->
        msg.send url unless err? or res.statusCode isnt 200
