# BSMediaPicker

Welcome to **BSMediaPicker,** a UI/UX framework for allowing users to quickly and easily select photos and/or videos from their device library as well as other third party applications. The libary implements both a UIImagePickerController and a UIDocumentPickerViewController to achieve this.

[![License](https://img.shields.io/badge/license-MIT-lightgrey)](https://en.wikipedia.org/wiki/MIT_License)
[![CocoaPods Compatible](https://img.shields.io/badge/pod-v0.1.0-blue)](https://img.shields.io/badge/pod-v0.1.0-blue)
[![Twitter](https://img.shields.io/badge/twitter-bstillita-1da1f2)](https://twitter.com/bstillita)
![Platform](https://img.shields.io/badge/platform-ios-success)

# Screenshots

![](screenshot.gif)

## Features

- [x] Able to set picker type on the fly (photo only, video only, photo and video)
- [x] Pre-built UI (no customisation....YET)
- [x] Implements the default UIImagePickerControllerDelegate and UIDocumentPickerDelegate into a handy single MediaPickerDelegate

## Requirements

* iOS 11.0+
* Xcode 9.0+

## Communication

- If you **need help**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/bsmediapicker). (Tag 'bsmediapicker')
- If you'd like to **ask a general question**, use [Stack Overflow](http://stackoverflow.com/questions/tagged/bsmediapicker).
- If you **found a bug**, _and can provide steps to reliably reproduce it_, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

> **Embedded frameworks require a minimum deployment target of iOS 11+.**
> - [Download BSMediaPicker](mailto:bstillitano95@gmail.com)

## CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate BSMediaPicker's features into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

pod 'BSMediaPicker', '~> 0.1.0'
```

Then, run the following command:

```bash
$ pod install
```

## Change Log

BSMediaPicker is a growing project and will encounter changes throughout its development. It is recommended that the [Change Log](https://github.com/bstillitano/BSMediaPicker/blob/master/CHANGELOG.md) be reviewed prior to updating versions.

## License

The MIT License (MIT)

Copyright (C) 2020, Brandon Joel Stillitano
All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
