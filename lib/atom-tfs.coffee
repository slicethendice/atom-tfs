setup = require './setup'
tfs = require 'tfs'
tfsUnlock = require 'tfs-unlock'

module.exports = AtomTfs =
  activate: (state) ->
    settings = setup()
    tfs.init 'visualStudioPath': tfs['vs' + settings.vsVersion]['bit' + settings.vsArchitecture]
    @_events()

  _events: ->
    atom.workspace.observeTextEditors (editor) ->
      editor.onDidStopChanging () =>
        if atom.workspace.getActivePaneItem().buffer and atom.workspace.getActivePaneItem().buffer.file.path
          tfsUnlock.checkout([atom.workspace.getActivePaneItem().buffer.file.path])
