# Description:
#   Link for adding NODE_AUTH_TOKEN for private node repos.
#
# Commands:
#   hubot NODE_AUTH_TOKEN - Reply with link


module.exports = (robot) ->
  robot.respond /NODE_AUTH_TOKEN me/i, (msg) ->
    msg.send "https://ghdocs.grubhub.com/architecture/platform/standards-and-practices/github/actions/packages/"