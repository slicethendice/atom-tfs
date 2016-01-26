# atom-tfs
**TFS package for Atom** _&nbsp; ― &nbsp; This is a work in progress..._

[![Build Status](https://travis-ci.org/ivangabriele/atom-tfs.svg?branch=master)](https://travis-ci.org/ivangabriele/atom-tfs)
[![NPM Version](https://img.shields.io/npm/v/atom-tfs.svg?style=flat)](https://www.npmjs.org/package/atom-tfs)
[![NPM Downloads](https://img.shields.io/npm/dm/atom-tfs.svg?style=flat)](https://www.npmjs.org/package/atom-tfs)
[![Dependency Status](https://david-dm.org/ivangabriele/atom-tfs.svg)](https://david-dm.org/ivangabriele/atom-tfs)
[![devDependency Status](https://david-dm.org/ivangabriele/atom-tfs/dev-status.svg)](https://david-dm.org/ivangabriele/atom-tfs#info=devDependencies)

---

## Important !

> **You MUST have Visual Studio and Team Foundation Server Power Tools installed to be able to use this extension.**

## Installation

1. Open up Atom
2. Type **`CTRL+MAJ+P`**
3. Type `install` in command palette.
4. Select `Settings View: Install Packages And Themes` and hit **`ENTER`**
5. Type `tfs` and hit **`ENTER`**
6. Select **`atom-tfs`** extension and hit **`ENTER`**

## Available commands

- **Checkin**
- **Get**
- **Undo**

## Contribute

To be able to contribute to TFS development, you need to be at ease with **NodeJS** language and **Git** usage.

    git clone https://github.com/ivangabriele/vscode-tfs.git
    cd vscode-tfs
    npm install
    npm install grunt-cli -g
    grunt githooks

The last command create a `pre-commit` hook to ensure that you don't commit anything if it the tests are not successful.

## Roadmap

1. **Auto-checkout** to be able to edit files without manually checking them out.
2. **Check In comment** to add a "check in" comment (and make it mandatory ?)
3. **Tree integration** to add a "check in" comment (and make it mandatory ?)
4. **History** to open history of changesets under TF.exe
5. **TFS Pane** to list pending changes
6. **Checkin multiple files** to add a "check in" comment (and make it mandatory ?)
7. **Exclude files from current checkin**

#### Links

- [atom-tfs package on atom.io](https://atom.io/packages/atom-tfs)
- [MIT Licence](https://github.com/ivangabriele/vscode-tfs/blob/master/LICENCE)
