# Using the Repository

## Table of Contents

-   [Overview](#overview)
-   [Using the `DataSource` Branch](#using-the-datasource-branch)
-   [Adding and Editing Documents](#adding-and-editing-documents)
-   [Tagging Documents](#tagging-documents)
-   [Deleting Documents](#deleting-documents)

---

## Overview

SupportDocs is pretty simple to use, with two parts: the GitHub repository and the library in your app.

-   The GitHub repository is where you add and edit your documents using Markdown. This is online, so you can edit at any time and always show the latest information to your users. All your documents are compiled into a single JSON file, the URL of which you'll pass into the library.
-   The library is what's displayed to your users, in your app. All it needs is the URL of the JSON file, and you can either use SwiftUI or UIKit to embed it.

## Using the `DataSource` branch

In you brand new repository that you set up earlier, switch to the `DataSource` branch. The example documents are inside `Sample-Boba`, `Sample-FastFood`, and `Sample-Smoothies` -- take a look around. Here's an [explanation of the directory listing](Documentation/DataSource.md#directory-listing).

Documents can be placed in the root directory or a subfolder. However, we recommmend that you use folders to organize your documents. In the example,

-   Documents tagged with `boba` are in the `Sample-Boba` folder
-   Documents tagged with `fastFood` are in the `Sample-FastFood` folder
-   Documents tagged with `smoothies` are in the `Sample-Smoothies` folder

## Adding and Editing Documents

To add a document, click the `Create new file` button.

If you want to add a document to add a folder, there are two ways:

1. Navigate to the folder then click `Create new file`
2. Click `Create new file` then, in the filename, put the folder name, followed by a slash (`/`), followed by the filename. (Example: `fastFood/Burgers.md`)
    - This method must be used if you want to create a new folder (read more [here](https://stackoverflow.com/a/63635965/14351818))

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

```
</td>
<td>
  <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Usage/MarkdownResult.png">
</td>
</tr>
</table>

## Tagging Documents

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

## Deleting Documents

Select the document to delete, then just click on the trash icon in the top-right corner.
