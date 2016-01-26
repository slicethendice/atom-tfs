tfs = require 'tfs'

checkin = (itemspec) ->
  # atom.notifications.addInfo 'TFS: Checking In...'

  try
    response = command = tfs 'checkin', itemspec
  catch error
    # console.error error
    return

  if response.isError
    # console.error response.error
    atom.notifications.addWarning 'TFS: This file is not under TFS versionning.'
    return

  atom.notifications.addSuccess 'TFS: Check In successful.'

module.exports = checkin
