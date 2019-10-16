# Description:
#   Causes heart attacks.
#
# Commands:
#   hubot deploy to production - Deploy Ralph to production.

apps = [
  'argos',
  'levelup-order-ahead-production',
  'levelup-production',
  'order-ahead-network-production',
  'plutus-production'
]

emojis = [
  ':+1:',
  ':dance:',
  ':party_poop:',
  ':party_try_not_to_cry:',
  ':partydumpster:',
  ':shush:',
  ':spinner:'
]

module.exports = (robot) ->
  robot.respond /deploy\s+to\s+prod(?:uction)?/i, (msg) ->
    reply = "ok, deploying myself to #{msg.random(apps)} #{msg.random(emojis)}"
    msg.send reply
