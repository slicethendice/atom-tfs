AtomTfsView = require './atom-tfs-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomTfs =
  atomTfsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomTfsView = new AtomTfsView(state.atomTfsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomTfsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-tfs:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomTfsView.destroy()

  serialize: ->
    atomTfsViewState: @atomTfsView.serialize()

  toggle: ->
    console.log 'AtomTfs was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
