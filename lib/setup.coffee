fs = require('fs')

fileExists = (filePath, isDirectory) ->
  try
    if isDirectory
      if fs.lstatSync(filePath).isDirectory()
        return true
    else
      if fs.lstatSync(filePath).isFile()
        return true
    return false
  catch exception
    return false
  return

setup = ->
  pf32Path = process.env['ProgramFiles(x86)']
  pf64Path = process.env['ProgramFiles']
  tfPath   = '/Common7/IDE/TF.exe'

  switch true
    when fileExists(pf64Path + '/Microsoft Visual Studio 14.0' + tfPath)
      vsArchitecture = 64
      vsVersion = 2015
    when fileExists(pf32Path + '/Microsoft Visual Studio 14.0' + tfPath)
      vsArchitecture = 32
      vsVersion = 2015
    when fileExists(pf64Path + '/Microsoft Visual Studio 12.0' + tfPath)
      vsArchitecture = 64
      vsVersion = 2013
    when fileExists(pf32Path + '/Microsoft Visual Studio 12.0' + tfPath)
      vsArchitecture = 32
      vsVersion = 2013
    when fileExists(pf64Path + '/Microsoft Visual Studio 11.0' + tfPath)
      vsArchitecture = 64
      vsVersion = 2012
    when fileExists(pf32Path + '/Microsoft Visual Studio 11.0' + tfPath)
      vsArchitecture = 32
      vsVersion = 2012
    when fileExists(pf64Path + '/Microsoft Visual Studio 10.0' + tfPath)
      vsArchitecture = 64
      vsVersion = 2010
    when fileExists(pf32Path + '/Microsoft Visual Studio 10.0' + tfPath)
      vsArchitecture = 32
      vsVersion = 2010
    when fileExists(pf64Path + '/Microsoft Visual Studio 9.0' + tfPath)
      vsArchitecture = 64
      vsVersion = 2008
    when fileExists(pf32Path + '/Microsoft Visual Studio 9.0' + tfPath)
      vsArchitecture = 32
      vsVersion = 2008
    else
      output.error 'Impossible to find you TF.exe'
      break

  {
    vsArchitecture: vsArchitecture
    vsVersion: vsVersion
  }

module.exports = setup
