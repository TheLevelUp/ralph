# Description:
#   cowsay with CommonMark code fencing to prevent overly clever text formatters from mangling
#   bovine speeches. Based on the stock Hubot cowsay script.
# Commands:
#   ralph cowsay <text> - Makes a cow say <text>
module.exports = (robot) ->
  robot.respond /cowsay( me)? (.*)/i, (msg) ->
    msg
      .http("http://cowsay.morecode.org/say")
      .query(format: 'text', message: msg.match[2])
      .get() (err, res, body) ->
        msg.send "```\n" + body + "\n```"
