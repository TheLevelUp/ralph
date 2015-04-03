# Description:
#   Interacts with Last.fm.
#
# Commands:
#   hubot I'm <username> on lastfm - Sets your Last.fm username.
#   hubot np - Displays what you're currently scrobbling.
#   hubot what am I listening to? - Displays what you're currently scrobbling.
#   hubot what's <name> listening to? - Displays what someone's currently scrobbling.
#   hubot what's everyone listening to? - Displays what everyone's currently scrobbling.
#   hubot what's playing in the men's room? - Displays what's on the boys' commode clock radio.
#   hubot who's listening to <artist>? - Displays who's scrobbling a certain artist.

cheerio = require 'cheerio'
LastFm = require('lastfm').LastFmNode

module.exports = (robot) ->

  robot.respond /I'm (\w+) on last\.?fm/i, (msg) ->
    username = msg.match[1]

    user = robot.brain.userForId(msg.message.user.id)
    user.lastfm = user.lastfm or {}
    user.lastfm.username = username

    msg.send "Okay, you're #{username} on Last.fm!"

  robot.respond /(?:what(?:'|\s+i)?s (.*)|what am I) listening to|np/i, (msg) ->
    name = msg.match[1] || msg.message.user.name

    if name is 'everyone'
      nowPlayingForAllUsers robot.brain.users(), msg
    else
      users = robot.brain.usersForFuzzyName(name)

      if users.length is 1
        nowPlayingForUser users[0], msg
      else if users.length > 1
        msg.send "Be more specific, I know #{users.length} people named like that: " +
          (user.name for user in users).join(', ')
      else
        msg.send "#{name}? Never heard of 'em!"

  robot.respond /(?:who(?:'|\s+i)?s listening to )(.+)/i, (msg) ->
    artist = msg.match[1]

    usersListeningToArtist robot.brain.users(), artist, msg

  robot.respond /(?:what(?:'|\s+i)?s playing in the )?(?:men|boy)'?s room/i, (msg) ->
    robot.http('http://wers.tunegenie.com').get() (err, res, body) ->
      if res.statusCode isnt 200
        msg.send "Oh no! I can't hear what's playing in the men's room."
        return

      $ = cheerio.load(body)
      title = $('.currentonair .song')?.first()?.text()
      artist = $('.currentonair .song + div > a')?.first()?.text()

      if title and artist
        msg.send "The boys are currently listening to #{title} by #{artist}"
      else
        msg.send "Oh no! I can't hear what's playing in the men's room"

nowPlayingForAllUsers = (users, msg) ->
  lastfmUsers = (user.lastfm.username for key, user of users when user.lastfm?.username?)
  nowPlaying = []
  usersRetrieved = 0

  for lastfmUser in lastfmUsers
    nowPlayingForLastfmUser lastfmUser,
      success: (track) ->
        nowPlaying.push "#{track.title} by #{track.artist}" if track
        usersRetrieved += 1

        if usersRetrieved >= lastfmUsers.length
          msg.send 'Everyone is listening to ' + nowPlaying.join(', ')

      error: (error) ->
        usersRetrieved += 1

nowPlayingForLastfmUser = (username, callbacks) ->
  lastfm = new LastFm
    api_key: process.env.HUBOT_LASTFM_API_KEY
    secret: process.env.HUBOT_LASTFM_API_SECRET
    useragent: 'hubot/v1.0 LevelUp Hubot'

  lastfm.request 'user.getRecentTracks',
    user: username
    limit: 1
    handlers:
      success: (data) ->
        track = data?.recenttracks?.track?[0]

        if track?['@attr']?.nowplaying is 'true'
          callbacks.success
            artist: track.artist['#text']
            title: track.name
        else
          callbacks.success null

      error: callbacks.error

nowPlayingForUser = (user, msg) ->
  if user.lastfm?.username?
    nowPlayingForLastfmUser user.lastfm.username,
      success: (track) ->
        if track
          msg.send "#{user.name} is listening to #{track.title} by #{track.artist}"
        else
          msg.send "#{user.name} is not scrobbling anything!"
      error: (error) ->
        msg.send "Oh no! An error occurred: #{error.message}"
  else
    msg.send "I don't know #{user.name}'s Last.fm username!"

usersListeningToArtist = (users, artist, msg) ->
  listeningToArtist = []
  usersChecked = 0
  theArtist = artist.toLowerCase()
  usersWithLastFm = (user for key, user of users when user.lastfm?.username?)

  checkTheUser = (theUser) ->
      nowPlayingForLastfmUser theUser.lastfm.username,
        success: (track) ->
          listeningToArtist.push theUser.name if track && track.artist.toLowerCase() == theArtist
          usersChecked += 1

          if usersChecked >= usersWithLastFm.length
            if listeningToArtist.length == 0
              msg.send "Nobody is listening to #{artist}."
            else if listeningToArtist.length == 1
              msg.send "#{listeningToArtist[0]} is listening to #{artist}."
            else
              msg.send "People listening to #{artist}: " + listeningToArtist.join ', '
        error: (error) ->
          msg.send "I couldn't see what #{theUser.name} is listening to! #{error}"
          usersChecked += 1

  for user in usersWithLastFm
    checkTheUser(user)
