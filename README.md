
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

### Navigation Bar
#### Title

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="4">
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationTitle.png">
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    navigationBar: .init(
      title: "Custom Nav Title"
    )
  )
  ```
  </td>
  </tr>

  <tr>
  <td>
    UIKit
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.navigationBar.title = "Custom Nav Title"
  ```
  </td>
  </tr>
</table>

#### Title Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="4">
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationTitleColor.png">
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    navigationBar: .init(
      title: "Custom Nav Title",
      titleColor: UIColor.purple
    )
  )
  ```
  </td>
  </tr>

  <tr>
  <td>
    UIKit
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.navigationBar.title = "Custom Nav Title"
  options.navigationBar.titleColor = UIColor.purple
  ```
  </td>
  </tr>
</table>

#### Dismiss Button Title

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="4">
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationDismissButtonTitle.png">
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    navigationBar: .init(
      dismissButtonTitle: "I Am Finished"
    )
  )
  ```
  </td>
  </tr>

  <tr>
  <td>
    UIKit
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.navigationBar.dismissButtonTitle = "I Am Finished"
  ```
  </td>
  </tr>
</table>

#### Button Tint Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="4">
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationButtonTintColor1.png"> <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationButtonTintColor2.png">
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    navigationBar: .init(
      dismissButtonTitle: "I Am Finished",
      buttonTintColor: UIColor.green
    )
  )
  ```
  </td>
  </tr>

  <tr>
  <td>
    UIKit
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.navigationBar.dismissButtonTitle = "I Am Finished"
  options.navigationBar.buttonTintColor = UIColor.green
  ```
  </td>
  </tr>
</table>

#### Background Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="4">
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationBackground1.png"> <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationBackground2.png">
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    navigationBar: .init(
      backgroundColor: UIColor(red: 217 / 255, green: 247 / 255, blue: 255 / 255, alpha: 1)
    )
  )
  ```
  </td>
  </tr>

  <tr>
  <td>
    UIKit
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.navigationBar.backgroundColor = UIColor(red: 217 / 255, green: 247 / 255, blue: 255 / 255, alpha: 1)
  ```
  </td>
  </tr>
</table>
