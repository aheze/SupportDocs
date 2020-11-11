
![SupportDocs Logo](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/SupportDocs.png)

### Generate help centers for your iOS apps, with Markdown!

![Examples](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/New%20Header.png)

# SupportDocs is currently under heavy development. Check back in a couple days!

## Table of Contents
- [How It Works](#how-it-works)
- [Installation](#installation)
    - [CocoaPods](#cocoapods)
    - [Swift Package Manager](#swift-package-manager)
- [Before You Begin](#before-you-begin)
    - [Tag Your Documents](#tag-your-documents)
- [Library Customization](Documentation/LibraryCustomization.md)
    - [Categories](Documentation/LibraryCustomization.md#categories)

## How It Works

First, you write documents using Markdown, and GitHub Pages automatically converts them into web pages.
Then, a GitHub Action goes through all your documents and compiles them into a single JSON, containing their URLs, titles, and tags.
Finally, the SupportDocs library in your app downloads the JSON and presents them in a customizable container.

![How It Works - Graphic](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/HowItWorks.png)

## Installation
### CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SupportDocs into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SupportDocs'
```

### Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but SupportDocs does support its use on supported platforms.

Once you have your Swift package set up, adding SupportDocs as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/aheze/SupportDocs.git", .upToNextMajor(from: "0.0.27"))
]
```


## Before You Begin
### Tag Your Documents
In your documents, add some [front matter](https://jekyllrb.com/docs/front-matter/) which sets the title and tags. Take [this example document](https://github.com/aheze/SupportDocs/blob/DataSource/Sample-Boba/BuyBlueBoba.md) in the `DataSource` branch.
```yaml
---
title: Buy blue boba
tags: boba
---
```

In this front matter, we have a title and one tag. This title has two purposes. It is the tab title if opened in a browser, and it is the title that SupportDocs shows. The tags can be linked as categories when configuring SupportDocs, and can be used to separate documents.

You can see the front matter for the documents in the DataSource branch in this graphic:
![Front Matter Examples](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Categories/colorCategories.png)