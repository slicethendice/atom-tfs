{CompositeDisposable} = require 'atom'

AtomTfs =
  view: null
  panel: null
  state:
    isOpen: false
  subscriptions: null

  activate: (@state) ->
    console.log @state
    @disposables = new CompositeDisposable
    @state.attached ?= true if @shouldAttach()

    @createView() if @state.attached

    @disposables.add atom.commands.add('atom-workspace', {
      'atom-tfs:toggle':  => @toggle()
      'atom-tfs:checkin': => @tfsExec('checkin')
      'atom-tfs:get':     => @tfsExec('get')
      'atom-tfs:undo':    => @tfsExec('undo')
    })

  deactivate: ->
    @disposables.dispose()

  serialize: ->
    if @atomTfsView?
      @atomTfsView.serialize()
    else
      @state

  createView: ->
    unless @atomTfsView?
      AtomTfsView = require './atom-tfs-view'
      @atomTfsView = new TfsView(@state)
    @atomTfsView

  shouldAttach: ->
    projectPath = atom.project.getPaths()[0]
    if atom.workspace.getActivePaneItem()
      false
    else if path.basename(projectPath) is '.git'
      # If .git was opened explicitly and not by using Atom as the Git editor.
      projectPath is atom.getLoadSettings().pathToOpen
    else
      true

  toggle: ->
    @state.isOpen = !@state.isOpen
    if @state.isOpen
      @open()
    else
      @close()

  open: ->
    @view = new WordcountView
    @panel = atom.workspace.addRightPanel({
      item: @view.getElement()
    })

  close: ->
    @panel.hide()

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
