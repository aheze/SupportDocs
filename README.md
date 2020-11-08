
![SupportDocs Logo](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/SupportDocsSmall.png)

### Generate help centers for your iOS apps, with Markdown!

![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/New%20Header.png)

# SupportDocs is currently under heavy development. Check back in a couple days!

---

### How it works

First, you write documents using Markdown, and GitHub Pages automatically converts them into web pages.
Then, a GitHub Action goes through all your documents and compiles them into a single JSON, containing their URLs, titles, and tags.
Finally, the SupportDocs library in your app downloads the JSON and presents them in a customizable container.

![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/HowItWorks.png)


### Table of Contents


### Installation



### Customization — Library

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="4">
    Image here
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    navigationBar: .init(
      title: "Support"
    )
  )
  ```
  </td>
  </tr>

  <tr>
  <td>
    SwiftUI
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.navigationBar.title = "Support"
  ```
  </td>
  </tr>
</table>
