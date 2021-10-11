# Description:
#   Link for adding node_auth_token for private node repos.
#
# Commands:
#   hubot node_auth_token me- Reply with link

module.exports = (robot) ->
  robot.respond /node\_auth\_token me/i, (msg) ->
    msg.send "https://ghdocs.grubhub.com/architecture/platform/standards-and-practices/github/actions/packages/"
