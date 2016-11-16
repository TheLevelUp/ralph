# Description:
#   Keep track of master branch status.
#
# Commands:
#   hubot freeze <project> - Marks <project>'s master branch as frozen.
#   hubot thaw <project> - Marks <project>'s master branch as thawed.
#   hubot frozen? <project> - Is <project>'s master branch frozen?
#   hubot thawed? <project> - Is <project>'s master branch thawed?
#   hubot merge? <project> - Can I merge to <project>'s master branch?
#   hubot master <project> - What's the status of <project>'s master branch?

Sugar = require 'sugar'

module.exports = (robot) ->
  robot.respond /freeze ?(.*)/i, (msg) ->
    Project.find msg.match[1], msg, (project) ->
      project.freeze msg.message.user
      msg.send project.shortDescription()

  robot.respond /thaw ?(.*)/i, (msg) ->
    Project.find msg.match[1], msg, (project) ->
      project.thaw msg.message.user
      msg.send project.shortDescription()

  robot.respond /(?:frozen\?|master|merge\?|thawed\?) ?(.*)/i, (msg) ->
    Project.find msg.match[1], msg, (project) ->
      msg.send project.fullDescription()

class Project
  @PROJECTS:
    'mothership': 'Mothership'
    'mship': 'Mothership'
    'ms': 'Mothership'
    'order ahead': 'Order Ahead'
    'order-ahead': 'Order Ahead'
    'oa': 'Order Ahead'
    'order ahead network': 'Order Ahead Network'
    'order-ahead-network': 'Order Ahead Network'
    'network': 'Order Ahead Network'
    'oan': 'Order Ahead Network'

  @DEFAULTS:
    'platform': 'Mothership'
    'platform-order-ahead': 'Order Ahead'
    'platform-order-ahead-network': 'Order Ahead Network'

  constructor: (name, robot) ->
    @name = name
    @robot = robot

  @default: (room) ->
    [_all, stream, topic] = room.match(/stream:(\S+) topic:(\S+)/)
    Project.DEFAULTS[stream]

  @find: (name, msg, callback) ->
    name ||= Project.default(msg.message.room)

    unless name
      msg.reply "There's no default project for this stream. Try: #{Project.projectsAsList()}"
      return

    normalized_name = Project.PROJECTS[name.trim().toLowerCase()]

    if normalized_name
      project = new Project(normalized_name, msg.robot)
      callback project
    else
      msg.reply "I don't know that project. Try: #{Project.projectsAsList()}"

  freeze: (user) ->
    @updateState ProjectState.FROZEN, user

  fullDescription: ->
    if @state().updatedAt() and @state().updatedBy()
      capitalizedState = Sugar.String.capitalize(@state().state())

      "#{@shortDescription()} (#{capitalizedState} by #{@state().updatedBy()} " +
        "#{@updatedAtDescription()}.)"
    else
      @shortDescription()

  @projects: ->
    Object.keys @PROJECTS

  @projectsAsList: ->
    Project.projects().join ', '

  shortDescription: ->
    "#{@name} is #{@state().emoji()}!"

  state: ->
    @_state ?= new ProjectState(this, @robot)

  thaw: (user) ->
    @updateState ProjectState.THAWED, user

  updatedAtDescription: ->
    updatedAt = @state().updatedAt()
    return unless updatedAt

    if Sugar.Date.isAfter(updatedAt, '12 hours ago')
      Sugar.Date.relative updatedAt
    else
      Sugar.Date.long updatedAt

  updateState: (state, user) ->
    @state().update state, user.name

class ProjectState
  @FROZEN: 'frozen'
  @FROZEN_EMOJI: [':icecream:', ':snowboarder:', ':snowflake:', ':snowman:']
  @THAWED: 'thawed'
  @THAWED_EMOJI: [':beach_with_umbrella:', ':sun_with_face:', ':sunny:']

  constructor: (project, robot) ->
    @project = project
    @robot = robot
    @keyBase = 'freezer:projects:' + @project.name.toLowerCase().replace(/\s+/g, '-')

  emoji: ->
    if @state() == ProjectState.FROZEN
      @robot.random ProjectState.FROZEN_EMOJI
    else if @state() == ProjectState.THAWED
      @robot.random ProjectState.THAWED_EMOJI
    else
      ':question:'

  get: (attribute) ->
    @robot.brain.get @key(attribute)

  key: (attribute) ->
    @keyBase + ':' + attribute

  set: (attribute, value) ->
    @robot.brain.set @key(attribute), value

  setState: (state) ->
    @set 'state', state

  setUpdatedAt: (updatedAt) ->
    @set 'updated-at', updatedAt.toJSON()

  setUpdatedBy: (updatedBy) ->
    @set 'updated-by', updatedBy

  state: ->
    @get 'state'

  update: (state, updatedBy) ->
    @setState state
    @setUpdatedAt new Date()
    @setUpdatedBy updatedBy

  updatedAt: ->
    updatedAt = @get('updated-at')
    new Date(updatedAt) if updatedAt

  updatedBy: ->
    @get 'updated-by'
