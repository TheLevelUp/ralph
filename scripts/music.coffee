# Description:
#   Interacts with Last.fm.
#
# Commands:
#   hubot I'm <username> on lastfm - Sets your Last.fm username.
#   hubot np - Displays what you're currently scrobbling.
#   hubot what am I listening to? - Displays what you're currently scrobbling.
#   hubot what's <name> listening to? - Displays what someone's currently scrobbling.
#   hubot what's everyone listening to? - Displays what everyone's currently scrobbling.

LastFm = require('lastfm').LastFmNode
util = require 'util'

module.exports = (robot) ->

  nowPlaying = (username, callbacks) ->
    lastfm = new LastFm
      api_key: process.env.HUBOT_LASTFM_API_KEY
      secret: process.env.HUBOT_LASTFM_API_SECRET
      useragent: 'hubot/v1.0 LevelUp Hubot'

    lastfm.request 'user.getRecentTracks',
      user: username
      limit: 1
      handlers:
        success: (data) ->
          track = data?.recenttracks?.track[0]

          if track['@attr'].nowplaying is 'true'
            callbacks.success
              title: track.name
              artist: track.artist['#text']
          else
            callbacks.success null

        error: callbacks.error

  robot.respond /I'm (\w+) on last\.?fm/i, (msg) ->
    username = msg.match[1]

    user = robot.brain.userForId(msg.message.user.id)
    user.lastfm = user.lastfm or {}
    user.lastfm.username = username

    msg.send "Okay, you're #{username} on Last.fm!"

  robot.respond /(?:what's (\w+)|what am I) listening to|np/i, (msg) ->
    name = msg.match[1] || msg.message.user.name

    if name is 'everyone'
      # TODO List what everyone is scrobbling
    else
      users = robot.brain.usersForFuzzyName(name)

      if users.length is 1
        user = users[0]
        user.lastfm = user.lastfm or {}
        self = user.id == msg.message.user.id

        if user.lastfm.username
          nowPlaying user.lastfm.username,
            success: (track) ->
              if track
                msg.send "#{user.name} is listening to #{track.title} by #{track.artist}"
              else
                msg.send "#{user.name} is not scrobbling anything!"
            error: (error) ->
              msg.send "Oh no! An error occurred: #{error}"
        else
          msg.send "I don't know #{user.name}'s Last.fm username!"
      else if users.length > 1
        msg.send "Be more specific, I know #{users.length} people named like that: " +
          (user.name for user in users).join(', ')
      else
        msg.send "#{name}? Never heard of 'em!"
