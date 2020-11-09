
![SupportDocs Logo](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/SupportDocsSmall.png)

### Generate help centers for your iOS apps, with Markdown!

![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/New%20Header.png)

# SupportDocs is currently under heavy development. Check back in a couple days!

---

## How it works

First, you write documents using Markdown, and GitHub Pages automatically converts them into web pages.
Then, a GitHub Action goes through all your documents and compiles them into a single JSON, containing their URLs, titles, and tags.
Finally, the SupportDocs library in your app downloads the JSON and presents them in a customizable container.

![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/HowItWorks.png)


# Table of Contents


# Installation

# Customization — Library
## Categories
Group multiple documents in the same section. You make a category by specifying the JSON tag name(s), title to display, and color of the row.

It’s easier to understand with an example. We’ll use the [documents](https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json) inside the DataSource branch, which are these:

![](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Categories/colorCategories.png)

As you can see, each document has `tags` applied to them. You put this in the [front matter](https://jekyllrb.com/docs/front-matter/), underneath the `title:` like this:

```
---
title: Buy blue boba
tags: boba <!-- put tags here! -->
---

# Buy blue boba

Blue and yummy. Buy this at [google.com](https://google.com)
```
Once your documents have `tags`, you can start using categories inside your app. Here’s how to make SupportDocs display one category that contains all documents tagged with “boba”:

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  
  <td>
    Result:　　　　　　　　↓
  </td>
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
      categories: [
          .init(
              jsonTagNames: ["boba"],
              displayName: "Display Name Is Boba",
              displayColor: UIColor.blue
          )
      ]
  )
  ```
  </td>
  <td rowspan="3">
    <kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Categories/oneCategory.png" width="200"></kbd>
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
  let bobaCategory = SupportOptions.Category(
      jsonTagNames: ["boba"],
      displayName: "Display Name Is Boba",
      displayColor: UIColor.blue
  )
        
  options.categories = [bobaCategory]
  ```
  </td>
  </tr>
</table>

<details>
  <summary>Show full code</summary>
<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    UIKit
  </td>
  </tr>
  
  <tr>
  <td>

  ```Swift
  struct SwiftUIExampleView_WithCategories: View {
      let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
      let options = SupportOptions(
          categories: [
              .init(
                  jsonTagNames: ["boba"],
                  displayName: "Display Name Is Boba",
                  displayColor: UIColor.blue
              )
          ]
      )
    
      @State var supportDocsPresented = false
    
      var body: some View {
          Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
          .sheet(isPresented: $supportDocsPresented, content: {
              SupportDocsView(dataSource: dataSource, options: options)
          })
      }
  }
  ```
  </td>
  <td>

  ```Swift
  class UIKitExampleController_WithCategories: UIViewController {
    
      /**
       Connect this inside the storyboard.
       
       This is just for demo purposes, so it's not connected yet.
       */
      @IBAction func presentButtonPressed(_ sender: Any) {
        
          let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
          var options = SupportOptions()
          let bobaCategory = SupportOptions.Category(
              jsonTagNames: ["boba"],
              displayName: "Display Name Is Boba",
              displayColor: UIColor.blue
          )
        
          options.categories = [bobaCategory]
        
          let supportDocsViewController = SupportDocsViewController(dataSource: dataSource, options: options)
          self.present(supportDocsViewController, animated: true, completion: nil)
      }
  }
  ```
  </td>
  </tr>

</table>
</details>

Here's how to use 2 categories:

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　↓
  </td>
  
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
      categories: [
          .init(
              jsonTagNames: ["boba"],
              displayName: "Display Name Is Boba",
              displayColor: UIColor.blue
          ),
          .init(
              jsonTagNames: ["fastFood"],
              displayName: "These aren't really healthy",
              displayColor: UIColor.red
          )
      ]
  )
  ```
  </td>
  <td rowspan="3">
    <kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Categories/twoCategories.png" width="200"></kbd>
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
  let bobaCategory = SupportOptions.Category(
      jsonTagNames: ["boba"],
      displayName: "Display Name Is Boba",
      displayColor: UIColor.blue
  )
  let fastFoodCategory = SupportOptions.Category(
      jsonTagNames: ["fastFood"],
      displayName: "These aren't really healthy",
      displayColor: UIColor.red
  )
        
  options.categories = [bobaCategory, fastFoodCategory]
  ```
  </td>
  </tr>
</table>

<details>
  <summary>Show full code</summary>
<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    UIKit
  </td>
  </tr>
  
  <tr>
  <td>

  ```Swift
  struct SwiftUIExampleView_WithCategories: View {
      let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
      let options = SupportOptions(
          categories: [
              .init(
                  jsonTagNames: ["boba"],
                  displayName: "Display Name Is Boba",
                  displayColor: UIColor.blue
              ),
              .init(
                  jsonTagNames: ["fastFood"],
                  displayName: "These aren't really healthy",
                  displayColor: UIColor.red
              )
          ]
      )
    
      @State var supportDocsPresented = false
    
      var body: some View {
          Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
          .sheet(isPresented: $supportDocsPresented, content: {
              SupportDocsView(dataSource: dataSource, options: options)
          })
      }
  }
  ```
  </td>
  <td>

  ```Swift
  class UIKitExampleController_WithCategories: UIViewController {
    
      /**
       Connect this inside the storyboard.
       
       This is just for demo purposes, so it's not connected yet.
       */
      @IBAction func presentButtonPressed(_ sender: Any) {
        
          let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
          var options = SupportOptions()
          let bobaCategory = SupportOptions.Category(
              jsonTagNames: ["boba"],
              displayName: "Display Name Is Boba",
              displayColor: UIColor.blue
          )
          let fastFoodCategory = SupportOptions.Category(
              jsonTagNames: ["fastFood"],
              displayName: "These aren't really healthy",
              displayColor: UIColor.red
          )
        
          options.categories = [bobaCategory, fastFoodCategory]
        
          let supportDocsViewController = SupportDocsViewController(dataSource: dataSource, options: options)
          self.present(supportDocsViewController, animated: true, completion: nil)
      }
  }
  ```
  </td>
  </tr>

</table>
</details>

You can also combine multiple `tags` into one category, like this:

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　↓
  </td>
  
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
      categories: [
          .init(
              jsonTagNames: ["boba", "fastFood"],
              displayName: "Food that tastes great",
              displayColor: UIColor.orange
          )
      ]
  )
  ```
  </td>
  <td rowspan="3">
    <kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Categories/twoTagsInOneCategory.png" width="200"></kbd>
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
  let bobaAndFastFoodCategory = SupportOptions.Category(
      jsonTagNames: ["boba", "fastFood"],
      displayName: "Food that tastes great",
      displayColor: UIColor.orange
  )
        
  options.categories = [bobaAndFastFoodCategory]
  ```
  </td>
  </tr>
</table>


<details>
  <summary>Show full code</summary>
<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    UIKit
  </td>
  </tr>
  
  <tr>
  <td>

  ```Swift
  struct SwiftUIExampleView_WithCategories: View {
      let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
      let options = SupportOptions(
          categories: [
              .init(
                  jsonTagNames: ["boba", "fastFood"],
                  displayName: "Food that tastes great",
                  displayColor: UIColor.orange
              )
          ]
      )
    
      @State var supportDocsPresented = false
    
      var body: some View {
          Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
          .sheet(isPresented: $supportDocsPresented, content: {
              SupportDocsView(dataSource: dataSource, options: options)
          })
      }
  }
  ```
  </td>
  <td>

  ```Swift
  class UIKitExampleController_WithCategories: UIViewController {
    
      /**
       Connect this inside the storyboard.
       
       This is just for demo purposes, so it's not connected yet.
       */
      @IBAction func presentButtonPressed(_ sender: Any) {
        
          let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
          var options = SupportOptions()
          let bobaAndFastFoodCategory = SupportOptions.Category(
              jsonTagNames: ["boba", "fastFood"],
              displayName: "Food that tastes great",
              displayColor: UIColor.orange
          )
        
          options.categories = [bobaAndFastFoodCategory]
        
          let supportDocsViewController = SupportDocsViewController(dataSource: dataSource, options: options)
          self.present(supportDocsViewController, animated: true, completion: nil)
      }
  }
  ```
  </td>
  </tr>

</table>
</details>


## Navigation Bar
### Title

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　　　　　↓
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
  <td rowspan="3">
    <kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationTitle.png"></kbd>
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

### Title Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　　　　　↓
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
  <td rowspan="3">
    <kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationTitleColor.png"></kbd>
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

### Dismiss Button Title

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　　　　　↓
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
  <td rowspan="3">
    <kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationDismissButtonTitle.png"></kbd>
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

### Button Tint Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　　　　　↓
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
  <td rowspan="3">
    Dismiss button ↓<br><kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationButtonTintColor1.png" width="300"></kbd><br>Back button (after selecting a document) ↓<br><kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationButtonTintColor2.png" width="300"></kbd>
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

### Background Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　　　　　↓
  </td>
  
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    navigationBar: .init(
      backgroundColor: UIColor(
        red: 217 / 255,
        green: 247 / 255,
        blue: 255 / 255,
        alpha: 1
      )
    )
  )
  ```
  </td>
  <td rowspan="3">
    Before scrolling ↓<br><kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationBackground1.png" width="300"></kbd><br>After scrolling ↓<br><kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/NavigationBar/navigationBackground2.png" width="300"></kbd>
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
  options.navigationBar.backgroundColor = UIColor(
    red: 217 / 255,
    green: 247 / 255,
    blue: 255 / 255,
    alpha: 1
  )
  ```
  </td>
  </tr>
</table>

## Progress Bar

### Foreground Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　　　　　↓
  </td>
  
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    progressBar: .init(
      foregroundColor: UIColor.red
    )
  )
  ```
  </td>
  <td rowspan="3">
    <kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ProgressBar/progressBarForeground.png"></kbd>
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
  options.progressBar.foregroundColor = UIColor.red
  ```
  </td>
  </tr>
</table>

### Background Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result:　　　　　　　　　　　　↓
  </td>
  
  </tr>

  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    progressBar: .init(
      foregroundColor: UIColor.red,
      backgroundColor: UIColor.blue
    )
  )
  ```
  </td>
  <td rowspan="3">
    <kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ProgressBar/progressBarBackground.png"></kbd>
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
  options.progressBar.foregroundColor = UIColor.red
  options.progressBar.backgroundColor = UIColor.blue
  ```
  </td>
  </tr>
</table>

## List Style

<table>

  <tr>
  <td>
  <code>.defaultListStyle</code>
  </td>
  <td>
  Result:　　　　　　↓
  </td>
  <td rowspan="30">
  </td>
  <td>
  <code>.plainListStyle</code>
  </td>
  <td>
  Result:　　　　　　↓
  </td>
  </tr>
  
  <tr>
  </tr>
  
  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="4">
  <kbd>
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/defaultListStyle.png" width="160">
  </kbd>
  </td>
  <td>
    SwiftUI
  </td>
  </td>
  <td rowspan="4">
  <kbd>
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/plainListStyle.png" width="160">
  </kbd>
  </td>
  </tr>
  
  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    listStyle: .defaultListStyle
  )
  ```
  </td>
  <td>

  ```Swift
  let options = SupportOptions(
    listStyle: .plainListStyle
  )
  ```
  </td>
  </tr>
  
  <tr>
  <td>
    UIKit
  </td>
  <td>
    UIKit
  </td>
  </tr>

  
  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.listStyle = .defaultListStyle
  ```
  </td>
  <td>
  
  ```Swift
  var options = SupportOptions()
  options.listStyle = .plainListStyle
  ```
  </td>
  </tr>
  
  
  
  
  
  
  
  
  
  <tr>
  <td colspan="5">
  </td>
  </tr>
  
  <tr>
  </tr>
  
  <tr>
  <td colspan="5">
  </td>
  </tr>
  
  <tr>
  </tr>
  
  
  
  <tr>
  <td>
  <code>.groupedListStyle</code>
  </td>
  <td>
  Result:　　　　　　↓
  </td>
  
  </td>
  <td>
  <code>.insetGroupedListStyle</code>
  </td>
  <td>
  Result:　　　　　　↓
  </td>
  </tr>
  
  
  <tr>
  </tr>
  
  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="4">
  <kbd>
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/groupedListStyle.png" width="160">
  </kbd>
  </td>
  <td>
    SwiftUI
  </td>
  </td>
  <td rowspan="4">
  <kbd>
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/insetGroupedListStyle.png" width="160">
  </kbd>
  </td>
  </tr>
  
  </tr>
  
  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    listStyle: .groupedListStyle
  )
  ```
  </td>
  <td>

  ```Swift
  let options = SupportOptions(
    listStyle: .insetGroupedListStyle
  )
  ```
  </td>
  </tr>
  
  <tr>
  <td>
    UIKit
  </td>
  <td>
    UIKit
  </td>
  </tr>

  
  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.listStyle = .groupedListStyle
  ```
  </td>
  <td>
  
  ```Swift
  var options = SupportOptions()
  options.listStyle = .insetGroupedListStyle
  ```
  </td>
  </tr>
  
  
  
  
  
  <tr>
  <td colspan="5">
  </td>
  </tr>
  <tr>
  </tr>
  <tr>
  <td colspan="5">
  </td>
  </tr>
  
  <tr>
  </tr>
  
  
  
  
  
  <tr>
  <td>
  <code>.insetListStyle</code>
  </td>
  <td>
  Result:　　　　　　↓
  </td>
  
  </td>
  <td>
  <code>.sidebarListStyle</code>
  </td>
  <td>
  Result:　　　　　　↓
  </td>
  </tr>
  
  
  <tr>
  </tr>
  
  <tr>
  <td>
    SwiftUI
  </td>
  <td rowspan="5">
  <kbd>
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/insetListStyle.png" width="160">
  </kbd>
  </td>
  <td>
    SwiftUI
  </td>
  </td>
  <td rowspan="5">
  <kbd>
    <img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/sidebarListStyle.png" width="160">
  </kbd>
  </td>
  </tr>
  
  <tr>
  <td>

  ```Swift
  let options = SupportOptions(
    listStyle: .insetListStyle
  )
  ```
  </td>
  <td>

  ```Swift
  let options = SupportOptions(
    listStyle: .sidebarListStyle
  )
  ```
  </td>
  </tr>
  
  <tr>
  <td>
    UIKit
  </td>
  <td>
    UIKit
  </td>
  </tr>

  
  <tr>
  <td>

  ```Swift
  var options = SupportOptions()
  options.listStyle = .insetListStyle
  ```
  </td>
  <td>
  
  ```Swift
  var options = SupportOptions()
  options.listStyle = .sidebarListStyle
  ```
  </td>
  </tr>
  
  
</table>

