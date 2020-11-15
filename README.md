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
-   [Basic Usage](#basic-usage)
    -   [Adding and Editing Documents](#adding-and-editing-documents)
    -   [Tagging Documents](#tagging-documents)
    -   [Extended Documentation](Documentation/UsingTheRepository.md)
        -   [Overview](#overview)
        -   [Using the `DataSource` Branch](#using-the-datasource-branch)
        -   [Adding and Editing Documents](#adding-and-editing-documents)
        -   [Tagging Documents](#tagging-documents)
        -   [Deleting Documents](#deleting-documents)
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

## Basic Usage

More Documentation:

-   [Overview](Documentation/UsingTheRepository.md#overview)
-   [Using the `DataSource` Branch](Documentation/UsingTheRepository.md#using-the-datasource-branch)
-   [Adding and Editing Documents](Documentation/UsingTheRepository.md#adding-and-editing-documents)
-   [Tagging Documents](Documentation/UsingTheRepository.md#tagging-documents)
-   [Deleting Documents](Documentation/UsingTheRepository.md#deleting-documents)

### Adding and Editing Documents

To add a document, click the `Create new file` button.

If you want to add a document to add a folder, there are two ways:

1. Navigate to the folder then click `Create new file`
2. Click `Create new file` then, in the filename, put the folder name, followed by a slash (`/`), followed by the filename. (Example: `fastFood/Burgers.md`)
    - Must be used to create a new folder (read more [here](https://stackoverflow.com/a/63635965/14351818))

| Add a Document                                                                                                               | Add a Document in the `Sample-Boba` Subfolder                                                                                   |
| :--------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------ |
| ![Root Directory "Create new file"](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Usage/CreateNewFile.png) | ![Subfolder "Create new file"](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Usage/CreateNewFileInFolder.png) |

Then, to make the document eligible for SupportDocs, you must fulfill these criteria:

-   The document extension must end in `.md`
-   At the top of the document (this is called the [front matter](https://jekyllrb.com/docs/front-matter/)), you need to fill in the `title`. We strongly suggest you add [tags](#tagging-documents) too.

```yaml
---
title: Buy blue boba
tags: boba
---

```

![Example File With Front Matter Highlighted](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Usage/DocumentCriteria.png)

The `title` is what will be displayed in each row of the list, in the SupportDocs library. Once you select a row, it's also what's shown as the title of the navigation bar.

| ![Title in Library List](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Usage/TitleInList.png) | ![Title in Navigation Bar](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Usage/TitleInNavigationBar.png) |
| --------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |


Everything after the `---` of the front matter is your document's content. You use [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) to write your documents.

<table>
<tr>
<td>
  Markdown
</td>
<td>
  Result
</td>
</tr>
<tr>
<td>
  
```markdown
---
title: Buy blue boba
tags: boba
---

# Buy blue boba

Blue and yummy. Buy this at [google.com](https://google.com)

1. Eat
2. Eat
3. Eat
4. Eat
5. Eat

![Blue Boba Image](https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/Images/blueBoba.jpg)

````
</td>
<td>
  <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Usage/MarkdownResult.png">
</td>
</tr>
</table>

### Tagging Documents

With tags, you get a lot of control over what to display in the library. To add tags, just fill in the `tags`, underneath the `title`. For example, check out this [example document](https://github.com/aheze/SupportDocs/blob/DataSource/Sample-Boba/BuyBlueBoba.md) in the `DataSource` branch.

```yaml
---
title: Buy blue boba
tags: boba
---
````

This document has the tag `boba`. As you might assume, there are other documents in the `DataSource` branch also tagged with `boba`.

Here is a graphic which shows the documents, titles, and tags in the `DataSource` branch.

![Documents with Front Matter](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Tags.png)

Once your documents have tags, you can choose to show which documents to show and which ones to hide, in the library. This is covered in the [Categories section](Documentation/LibraryCustomization.md#categories) of the library customization documentation.
