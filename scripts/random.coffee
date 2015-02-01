# Description:
#   Exposes Response#random as a method on Robot.

module.exports = (robot) ->
  robot.random = robot.Response.prototype.random
