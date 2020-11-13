![SupportDocs Logo](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/SupportDocs.png)

### Generate help centers for your iOS apps, with Markdown!

![Examples](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/New%20Header.png)

# SupportDocs is currently under heavy development. Check back in a couple days!

## Table of Contents

-   [How It Works](#how-it-works)
-   [Installation](#installation)
    -   [CocoaPods](#cocoapods)
    -   [Swift Package Manager](#swift-package-manager)
-   [Before You Begin](#before-you-begin)
    -   [Tag Your Documents](#tag-your-documents)
-   [Library Customization](Documentation/LibraryCustomization.md)
    -   [Examples](Documentation/LibraryCustomization.md#examples)
        -   [SwiftUI](Documentation/LibraryCustomization.md#swiftui)
        -   [UIKit](Documentation/LibraryCustomization.md#uikit)
    -   [Categories](Documentation/LibraryCustomization.md#categories)
        -   [One Tag](Documentation/LibraryCustomization.md#one-tag)
        -   [Two Tags](Documentation/LibraryCustomization.md#two-tags)
        -   [Multiple Tags in One Category](Documentation/LibraryCustomization.md#multiple-tags-in-one-category)
    -   [Navigation Bar](Documentation/LibraryCustomization.md#navigation-bar)
        -   [Title](Documentation/LibraryCustomization.md#title)
        -   [Title Color](Documentation/LibraryCustomization.md#title-color)
        -   [Dismiss Button Title](Documentation/LibraryCustomization.md#dismiss-button-title)
        -   [Button Tint Color](Documentation/LibraryCustomization.md#button-tint-color)
        -   [Background Color](Documentation/LibraryCustomization.md#background-color)
    -   [Progress Bar](Documentation/LibraryCustomization.md#progress-bar)
        -   [Foreground Color](Documentation/LibraryCustomization.md#foreground-color)
        -   [Background Color](Documentation/LibraryCustomization.md#background-color-1)
    -   [List Style](Documentation/LibraryCustomization.md#list-style)

## How It Works

1. Write documents in Markdown
2. Wait for the GitHub Action to generate a JSON data source and a README for you
3. Let GitHub Pages compile the documents into a website
4. The SupportDocs library downloads the JSON and compiles it into a customizable format

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
