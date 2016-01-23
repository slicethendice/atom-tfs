{CompositeDisposable} = require 'atom'
tfs = require 'tfs'

module.exports = AtomTfs =
  subscriptions: null

  activate: (state) ->
    console.log 'TFS activated'

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-tfs:toggle': => @toggle()
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-tfs:get': => @get()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  toggle: ->
    console.log 'AtomTfs was toggled!'

  get: ->
    console.log 'Atom TFS GET !'
    console.log atom.workspace.getActivePaneItem()
