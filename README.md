# macOS CLI Template

## Motivation

I'm writing more and more Swift CLI apps these days. And as I solve more problems with these litte tools, I find that I'm copying the same code and utilities from one project to the next. Also, I'm importing the same packages over and over. So I wanted to automate the creation of macOS Swift CLI Projects, and have kind of a "starter template Swift-based CLI Xcode Project"

## Prerequisites

This template uses Tuist to generate the project, so you need:
- Xcode 13 & 14 Beta 6 (not tested with other versions, should work)
- Install [Tuist](https://tuist.io/)

## How to use it

- 👥 clone this repo `git clone https://github.com/dfreniche/SwiftCLITemplate`
- 💻 `cd SwiftCLITemplate`
- 📝 edit & change parameters in `Project.swift`
- 💻 run `tuist generate`
- 🛠 open generated project
- 🎉 profit! 
