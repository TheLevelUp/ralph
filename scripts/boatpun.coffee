# Description:
#   Boat puns.
#
# Dependencies:
#   None
# 
# Configuration:
#   None
#
# Commands:
#   hubot boat - Returns a boat pun
#   hubot meat - Returns a meat pun
#
# Author:
#   BM5k
#
# Pun source:
#   http://www.punoftheday.com/cgi-bin/disppuns.pl?ord=S&cat=2&sub=0202&page=1

module.exports = (robot) ->
  robot.hear /boat/i, (msg) ->
    quotes = [
      "He was arrested for throwing bombs from a boat, but they dropped the charges.",
      "In ancient times, seagoing vessels were much more fuel efficient. They got thousands of miles to the galleon.",
      "Why did the admiral decide against buying a new hat? He was afraid of cap sizing.",
      "I'm not one for buoyancy but whatever floats your boat.",
      "Suicide at sea is definitely going overboard.",
      "Doctors feel fine on ships because they are accustomed to see sickness.",
      "Making a boat out of stone would be a hardship.",
      "What keeps a dock floating above water? Pier pressure.",
      "Old sailors never die, they just get a little dinghy.",
      "When the bottom of a cargo ship got a hole, it had one hull of a problem.",
      "A boating accident between the yacht, Red Dawn, and the schooner, Blue Lagoon, left the survivors marooned.",
      "A guy who crosses the ocean twice without a shower is a dirty double crosser.",
      "A sailor eating alphabet soup found the seven C's.",
      "As his little ships sailed on Christopher Columbus didn't tell his crew he felt constantly on edge.",
      "The cost of a galvanized hull is enough to zinc a ship.",
      "The vegetable never taken aboard ship is a leek.",
      "He would have become a sailor but he didn't want to make waves."
    ]
    msg.send msg.random quotes

  robot.hear /meat/i, (msg) ->
    quotes = [
      "Charles fell into the meat grinder. Now he's ground Chuck.",
      "Nate is pleased by meat puns quite rarely.",
      "When news that a meat shipment was coming reached the gold rush you could stake your claim and then claim your steak.",
      "Inside a hot dog factory you never sausage a sight before.",
      "Animals are slaughtered for meat at a tender age."
    ]
    msg.send msg.random quotes
