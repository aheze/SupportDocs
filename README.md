![SupportDocs Logo](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/SupportDocsSmall.png)

![SupportDocs Header](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/HeaderImage.png)

### Generate help centers for your iOS apps, with Markdown!

# SupportDocs is currently under heavy development. Check back in a couple days!

## Table of Contents

-   [How It Works](#how-it-works)
-   [Installation](#installation)
    -   [Set Up the GitHub Repository](#set-up-the-github-repository)
    -   [Install the Library](#install-the-library)
        -   [CocoaPods](#cocoapods)
        -   [Swift Package Manager](#swift-package-manager)
-   [Using the Repository](Documentation/UsingTheRepository.md)
    -   [Overview](Documentation/UsingTheRepository.md#overview)
    -   [Using the `DataSource` Branch](Documentation/UsingTheRepository.md#using-the-datasource-branch)
    -   [Adding and Editing Documents](Documentation/UsingTheRepository.md#adding-and-editing-documents)
    -   [Tagging Documents](Documentation/UsingTheRepository.md#tagging-documents)
    -   [Deleting Documents](Documentation/UsingTheRepository.md#deleting-documents)
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
2. Let GitHub Pages compile the documents into a website
3. Wait for the GitHub Action to generate a JSON data source and a README for you
4. The SupportDocs library downloads the JSON and compiles it into a customizable format

![How It Works - Graphic](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/HowItWorks.png)

## Installation

Installing SupportDocs takes two steps:

1. Set up the GitHub repository where you write and host your documents
2. Install the library inside your app

### Set Up the GitHub Repository

This will be where you write your documents. GitHub Pages will translate your Markdown into HTML, and a custom GitHub Action will automatically compile the web pages into a JSON file.

1. Scroll up to the top of this page and click <kbd>Use this template</kbd>
2. Enter a repository name -- this can be whatever you want
3. Make sure it's set to `Public` (If you are using the free version of GitHub, GitHub Pages only works for public repos)
4. Make sure to check **Include all branches**. This is **really** important.
5. Click <kbd>Create repository from template</kbd>
6. In your brand new repository, click the <kbd>Settings</kbd> tab
7. Scroll down to the GitHub Pages section, and select `DataSource` branch and **/ (root)** folder. Then click <kbd>Save</kbd>.
8. That's it for the GitHub repository! Now time to install the library in your app.

| ![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Installation/GitHubRepo1.png) | ![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Installation/GitHubRepo2.png) |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| ![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Installation/GitHubRepo3.png) | ![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Installation/GitHubRepo4.png) |

### Install the Library

This is the actual interface that your users will see. You can install using **CocoaPods** or **Swift Package Manager**, whichever one you prefer.

#### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To install SupportDocs into your Xcode project using CocoaPods, add it in your `Podfile`:

```ruby
pod 'SupportDocs'
```

#### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is built into Xcode, which makes it really easy to use.

1. Go to your project settings
2. Click your project
3. Click the <kbd>+</kbd> button
4. Enter `https://github.com/aheze/SupportDocs` in the text field
5. Click <kbd>Next</kbd>
6. Enter the latest version, `0.0.30`, in the text field. Leave <kbd>Up to Next Major</kbd> selected.
7. Click <kbd>Next</kbd>
8. Click <kbd>Finish</kbd>, and you're done!

| ![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Installation/SPM1.png) | ![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Installation/SPM2.png) |
| ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------ |
| ![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Installation/SPM3.png) | ![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Installation/SPM4.png) |