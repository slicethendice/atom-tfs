{CompositeDisposable} = require 'atom'
tfs = require 'tfs'

module.exports = AtomTfs =
  subscriptions: null

  activate: (state) ->
    console.info 'atom-tfs', 'Activated'

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-tfs:get': => @get()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  get: ->
    activePanelItem = atom.workspace.getActivePaneItem();

    # If this is "Settings" panel or an unsaved file
    if !activePanelItem.buffer or !activePanelItem.buffer.file
      return

    console.info 'atom-tfs', 'GET ' + activePanelItem.buffer.file.path

    command = tfs 'get', activePanelItem.buffer.file.path
    console.info 'atom-tfs', command
