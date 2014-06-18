# Description:
#   World Cup 2014 matches and scores
#
# Commands:
#   hubot world cup schedule - World Cup schedule for today
#   hubot world cup score - Match scores

module.exports = (robot) ->
  robot.respond /world cup( schedule| matches)?/i, (msg) ->
    robot.http('http://worldcup.sfg.io/matches/today')
      .get() (err, res, body) ->
        unless err? or res.statusCode isnt 200
          data = JSON.parse(body)
          data.forEach (match) ->
            homeTeam = match.home_team.country
            awayTeam = match.away_team.country
            time = (new Date(match.datetime)).toTimeString()
            msg.send "#{homeTeam} v. #{awayTeam} @ #{time}"

  robot.respond /world cup scores?/i, (msg) ->
    robot.http('http://worldcup.sfg.io/matches/current')
      .get() (err, res, body) ->
        unless err? or res.statusCode isnt 200
          data = JSON.parse(body)
          data.forEach (match) ->
            homeTeam = "#{match.home_team.country} #{match.home_team.goals}"
            awayTeam = "#{match.away_team.goals} #{match.away_team.country}"
            msg.send "#{homeTeam} - #{awayTeam}"
