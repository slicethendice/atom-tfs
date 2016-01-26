tfs = require 'tfs'

get = (itemspec) ->
  # atom.notifications.addInfo 'TFS: Getting Latest Version...'

  try
    response = command = tfs 'get', itemspec
  catch error
    # console.error error
    return

  if response.isError
    # console.error response.error
    atom.notifications.addWarning 'TFS: This file is not under TFS versionning.'
    return

  atom.notifications.addSuccess 'TFS: Get Latest successful.'

module.exports = get
