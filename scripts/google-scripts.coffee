# Description:
#   Tells you today's lunch
# Commands:
#   what's for lunch - tells you what's for lunch today

module.exports = (robot) ->
  robot.hear /what'?s (?:for )?lunch/i, (msg) ->
    google_app_script(robot, "MNoqeeH_HBrkP3k-g38ZVEPwDQmPTjn1k", "getTodaysLunch")

google_app_script = (robot, scriptId, fun) ->
  robot.emit "googleapi:request",
    service: "scripts"
    version: "v1"
    endpoint: "%{scriptId}:run"
    params:                               # parameters to pass to API
      function: fun
    callback: (err, data)->               # node-style callback
      return console.log(err) if err
      console.log data
