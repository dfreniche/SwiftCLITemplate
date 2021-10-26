# macOS CLI Template

## Motivation

I'm writing more and more Swift CLI apps these days. And as I solve more problems with this litte tools, I find that I'm copying the same code and utilities from one project to the next. Also, importing the same packages over and over. So I wanted to automate the creation of macOS Swift CLI Projects.

## Prerequisites

This template uses Tuist to generate the project, so you need:
- Xcode 13 (not tested with other versions, should work)
- [Tuist](https://tuist.io/)

## How to use it

- clone this repo `git clone https://www.github.com`
- `cd SwiftCLITemplate`
- change parameters in `Project.swift`
- `tuist generate`
- open generated project
- profit! 
