AtomTfsView = require './atom-tfs-view'
{CompositeDisposable} = require 'atom'

setup = require './setup'
tfs = require 'tfs'
tfsUnlock = require 'tfs-unlock'

module.exports = AtomTfs =
  myPackageView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomTfsView = new AtomTfsView(state.atomTfsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomTfsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-tfs:toggle': => @toggle()

    settings = setup()
    tfsUnlock.init 'visualStudioPath': tfsUnlock['vs' + settings.vsVersion]['bit' + settings.vsArchitecture]
    @_events()


  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomTfsView.destroy()

  serialize: ->
    atomTfsViewState: @atomTfsView.serialize()

  toggle: ->
    console.log 'Atom TFS was toggled !'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()

  get: ->
    if atom.workspace.getActivePaneItem().buffer and atom.workspace.getActivePaneItem().buffer.file.path
      console.error 'Hey !'
      tfs 'get', atom.workspace.getActivePaneItem().buffer.file.path, recursive: true

  undo: ->
    if atom.workspace.getActivePaneItem().buffer and atom.workspace.getActivePaneItem().buffer.file.path
      tfs 'undo', atom.workspace.getActivePaneItem().buffer.file.path

  _events: ->
    atom.workspace.observeTextEditors (editor) ->
      editor.onDidStopChanging () =>
        if atom.workspace.getActivePaneItem().buffer and atom.workspace.getActivePaneItem().buffer.file.path
          tfsUnlock.checkout([atom.workspace.getActivePaneItem().buffer.file.path])
