# atom-tfs
**TFS Atom integration** _&nbsp; ― &nbsp; This is a work in progress..._

[![Build Status](https://travis-ci.org/ivangabriele/atom-tfs.svg?branch=master)](https://travis-ci.org/ivangabriele/atom-tfs)
[![NPM Version](https://img.shields.io/npm/v/atom-tfs.svg?style=flat)](https://www.npmjs.org/package/atom-tfs)
[![NPM Downloads](https://img.shields.io/npm/dm/atom-tfs.svg?style=flat)](https://www.npmjs.org/package/atom-tfs)
[![Dependency Status](https://david-dm.org/ivangabriele/atom-tfs.svg)](https://david-dm.org/ivangabriele/atom-tfs)
[![devDependency Status](https://david-dm.org/ivangabriele/atom-tfs/dev-status.svg)](https://david-dm.org/ivangabriele/atom-tfs#info=devDependencies)

---

## Important !

> **You MUST have Visual Studio 2010 or above installed with Team Foundation Server.**

## About TFS permissions

To be able to use this plugin as is, you also need to be able to execute 'TF.exe' commands in your favorite CLI without any login window. It may be planned to implement an auto `/login` to avoid that but this would be highly unsafe to store your login and password into settings.

## Available commands

- **GET**

## Roadmap

- **STATUS BAR OUTPUT** to show TFS output logs and errors
- **AUTO CHECKOUT FOR EDIT** to be able to edit files without unchecking "Read-only" files property
- **CHECKIN** command implementation
- **UNDO** command implementation
