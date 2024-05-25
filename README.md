# macOS CLI Template 🖥

## Motivation

I'm writing more and more Swift CLI apps these days. And as I solve more problems with these little tools, I find that I'm copying the same code and utilities from one project to the next. Also, I'm importing the same packages over and over. So I wanted to automate the creation of macOS Swift CLI Projects, and have kind of a "starter template Swift-based CLI Xcode Project"

## Prerequisites

This template uses Tuist to generate the project, so you need:
- Xcode 13 & 14 (not tested with other versions, should work)
- Make sure you're using the right Command Line Tools for the version of Xcode you're using. `xcode-select -p` prints the path to the Command Line Tools active. In Xcode Settings you can change the active ones. 
- Install [Tuist](https://tuist.io/). I'm using Tuist 3, so if you already have Tuist installed check your version or run `tuist update`.

## How to use it

- 👥 clone this repo with `git clone https://github.com/dfreniche/SwiftCLITemplate`
- 💻 rename that folder with `mv SwiftCLITemplate MyCLIApp`
- 💻 `cd SwiftCLITemplate` (or if you renamed, `cd MyCLIApp`)
- 📝 edit & change parameters in `Project.swift`
- 💻 run `tuist generate`
- 🛠 open generated project
- 🎉 profit! 

## What's in here

A simple CLI macOS App with an async starting point `AsyncMainCLI.swift`. It downloads an image and shows it using `open`. Review the code in `Sources` folder.

## Troubleshooting

- To generate the Project not using Tuist caches use:

```bash
tuist fetch && tuist generate --no-cache
```

- if you get `"error: 'swiftpackagemanager': Invalid manifest"`

Apparently, after installing Xcode 14 on macOS Monterrey (12.6), Xcode path was incorrect:

Fixed it with the command:

```bash
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

Source: [issue](https://github.com/dfreniche/SwiftCLITemplate/issues/1)
