{CompositeDisposable} = require 'atom'
WordcountView = require './atom-tfs-view'

AtomTfs =
  atomTfsView: null
  state:
    isOpen: false
  subscriptions: null

  activate: (state) ->
    console.log(state);
    @state = state

    @subscriptions = new CompositeDisposable
    @subscriptions.add(atom.commands.add('atom-workspace', 'atom-tfs:toggle':  => @toggle()))
    @subscriptions.add(atom.commands.add('atom-workspace', 'atom-tfs:checkin': => @tfsExec('checkin')))
    @subscriptions.add(atom.commands.add('atom-workspace', 'atom-tfs:get':     => @tfsExec('get')))
    @subscriptions.add(atom.commands.add('atom-workspace', 'atom-tfs:undo':    => @tfsExec('undo')))

    if @state.isOpen
      @open()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->
    @state

  toggle: ->
    @state.isOpen = !@state.isOpen
    if @state.isOpen
      @open()
    else
      @close()

  open: ->
    @atomTfsView = new WordcountView
    atom.workspace.addRightPanel({
      item: @atomTfsView.getElement()
    })

  close: ->
    atom.workspace.addRightPanel({
      item: @atomTfsView.getElement()
    })

  tfsExec: (command) ->
    activePanelItem = atom.workspace.getActivePaneItem()

    # If there is no file edited in the active panel
    if not activePanelItem.buffer?
      vscode.window.showErrorMessage 'TFS: There is no file opened.'
      return

    # If this is an new untitled file
    if not activePanelItem.buffer.file?
      vscode.window.showErrorMessage('TFS: You need to save your file somewhere before.');
      return

    require('./tfs/' + command)([activePanelItem.buffer.file.path])

module.exports = AtomTfs
