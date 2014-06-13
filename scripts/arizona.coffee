# Description:
#   Arizona memes
# Commands:
#   hubot arizona - Retuns an arizona fact
module.exports = (robot) ->
  robot.hear /arizona/i, (msg) ->
    quotes = [
      "The Arizona ridge-nosed rattlesnake is perhaps the most beautiful of all eleven species of rattlesnakes found in Arizona.",
      "The colors blue and gold are the official state colors.",
      "Located in Fountain Hills is a fountain believed to be the tallest in the world.",
      "Four Corners is noted as the spot in the United States where a person can stand in four states at the same time.",
      "The age of a saguaro cactus is determined by its height.",
      "The Apache trout is considered a threatened species under the federal Endangered Species Act.",
      "Arizona, among all the states, has the largest percentage of its land set aside and designated as Indian lands.",
      "Rising to a height of 12,643 feet, Mount Humphreys north of Flagstaff is the state's highest mountain.",
      "The Hopi Indians of Arizona are noted for growing their multicolored corn.",
      "Barry Goldwater, a famous public official, senator, and presidential candidate was born in Phoenix.",
      "In 1939 architect Frank Lloyd Wright's studio, Taliesin West, was built near Phoenix.",
      "Oraibi is the oldest Indian settlement in the United States. The Hopis Indians founded it.",
      "Grand Canyon's Flaming Gorge got its name for its blazing red and orange colored, twelve-hundred-foot-high walls.",
      "Grand Canyon's Disaster Falls was named to commemorate the site of a previous explorer's wreck.",
      "Grand Canyon's Marble Canyon got its name from its thousand-foot-thick seam of marble and for its walls eroded to a polished glass finish.",
      "Arizona became the 48th state on February 14, 1912.",
      "The world's largest solar telescope is located at Kitts Peak National Observatory in the city of Sells.",
      "At one time camels were used to transport goods across Arizona.",
      "Between the years 1692 and 1711 Father Eusebio Kino focused on area missionary work. During the time many grain and stock farms began.",
      "A person from Arizona is called an Arizonan.",
      "Phoenix originated in 1866 as a hay camp to supply Camp McDowell.",
      "The famous labor leader, Ceasar Estrada Chavez, was born in Yuma.",
      "Tombstone, Ruby, Gillette, and Gunsight are among the ghost towns scattered throughout the state.",
      "Harming a saguaro in any manner, including cactus plugging, is illegal by state law in Arizona, and when houses or highways are built, special permits must be obtained to move or destroy any saguaro affected.",
      "Wesley is from Arizona.",
      "Arizona observes DST from a distance, laughing at those who employ it."
      "The saguaro cactus is native to the Sonoran Desert in the U.S. state of Arizona, the Mexican state of Sonora, and the Whipple Mountains and Imperial County areas of California.",
      "The saguaro blossom is the State Wildflower of Arizona."
    ]
    msg.send msg.random quotes
