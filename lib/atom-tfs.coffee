{CompositeDisposable} = require 'atom'

module.exports = AtomTfs =
  subscriptions: null

  activate: (state) ->
    console.log atom

    @subscriptions = new CompositeDisposable
    @subscriptions.add(atom.commands.add('atom-workspace', 'atom-tfs:checkin': => @tfsExec('checkin')))
    @subscriptions.add(atom.commands.add('atom-workspace', 'atom-tfs:get': => @tfsExec('get')))
    @subscriptions.add(atom.commands.add('atom-workspace', 'atom-tfs:undo': => @tfsExec('undo')))

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  tfsExec: (command) ->
    activePanelItem = atom.workspace.getActivePaneItem()

    # If there is no file edited in the active panel
    if !activePanelItem.buffer
      vscode.window.showErrorMessage 'TFS: There is no file opened.'
      return

    # If this is an new untitled file
    if !activePanelItem.buffer.file
      vscode.window.showErrorMessage('TFS: You need to save your file somewhere before.');
      return

    require('./tfs/' + command)([activePanelItem.buffer.file.path])
