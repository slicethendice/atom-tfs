tfs = require 'tfs'

undo = (itemspec) ->
  # atom.notifications.addInfo 'TFS: Undoing Pending Changes...'

  try
    response = command = tfs 'undo', itemspec
  catch error
    # console.error error
    return

  if response.isError
    # console.error response.error
    atom.notifications.addWarning 'TFS: This file is not under TFS versionning.'
    return

  atom.notifications.addSuccess 'TFS: Undo successful.'

module.exports = undo
