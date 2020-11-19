# Library Customization

## Table of Contents

-   [Examples](#examples)
    -   [SwiftUI](#swiftui)
    -   [UIKit](#uikit)
-   [Categories](#categories)
    -   [One Tag](#one-tag)
    -   [Two Tags](#two-tags)
    -   [Multiple Tags in One Category](#multiple-tags-in-one-category)
-   [Navigation Bar](#navigation-bar)
    -   [Title](#title)
    -   [Title Color](#title-color)
    -   [Dismiss Button Title](#dismiss-button-title)
    -   [Button Tint Color](#button-tint-color)
    -   [Background Color](#background-color)
-   [Progress Bar](#progress-bar)
    -   [Foreground Color](#foreground-color)
    -   [Background Color](#background-color-1)
-   [List Style](#list-style)
-   [Navigation View Style](#navigation-view-style)
-   [Dark Mode](#dark-mode)
-   [Other](#other)

---

## Overview

Almost everything in the SupportDocs library can be customized through the `SupportOptions` struct.

![SupportOptions Graphic](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/CustomizableOptions.png)

## Examples

### SwiftUI

-   [MinimalSupportDocs.swift](Examples/SwiftUI/MinimalSupportDocs.swift)
-   [SupportDocsWithCategories.swift](Examples/SwiftUI/SupportDocsWithCategories.swift)
-   [SupportOptions.swift](Examples/SwiftUI/SupportOptions.swift)

### UIKit

-   [MinimalSupportDocs.swift](Examples/UIKit/MinimalSupportDocs.swift)
-   [SupportDocsWithCategories.swift](Examples/UIKit/SupportDocsWithCategories.swift)
-   [SupportOptions.swift](Examples/UIKit/SupportOptions.swift)

## Categories

Group multiple documents in the same section. You make a category by specifying the tag(s), display name, and (optionally) color of the text in the category.

![Categories Preview](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/CategoriesPreview.png)

### Important: Before You Begin

Make sure you have added the correct front matter to your documents. See the [Tag Your Documents](../README.md#tag-your-documents) section of the README.

### One Tag

Once your documents have tags, you can start using categories inside your app. Here’s how to make SupportDocs display one category that contains all documents with the tag “boba”:

<table>
  <tr>
  <td>
    SwiftUI
  </td>
  
  <td>
    Result
  </td>
  </tr>

  <tr>
  <td>

```swift
let options = SupportOptions(
    categories: [
        .init(
            tags: ["boba"],
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

```swift
var options = SupportOptions()
let bobaCategory = SupportOptions.Category(
    tags: ["boba"],
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
  </tr>
  
  <tr>
  <td>

```swift
struct SwiftUIExampleView_WithCategories: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

    let options = SupportOptions(
        categories: [
            .init(
                tags: ["boba"],
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
  </tr>
  <tr>
  <td>UIKit</td>
  </tr>
  <tr>
  <td>

```swift
class UIKitExampleController_WithCategories: UIViewController {

    /**
     Connect this inside the storyboard.

     This is just for demo purposes, so it's not connected yet.
     */
    @IBAction func presentButtonPressed(_ sender: Any) {

        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

        var options = SupportOptions()
        let bobaCategory = SupportOptions.Category(
            tags: ["boba"],
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

---

### Two Tags

<table>
  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result
  </td>
  </tr>
  <tr>
  <td>

```swift
let options = SupportOptions(
    categories: [
        .init(
            tags: ["boba"],
            displayName: "Display Name Is Boba",
            displayColor: UIColor.blue
        ),
        .init(
            tags: ["fastFood"],
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

```swift
var options = SupportOptions()
let bobaCategory = SupportOptions.Category(
    tags: ["boba"],
    displayName: "Display Name Is Boba",
    displayColor: UIColor.blue
)
let fastFoodCategory = SupportOptions.Category(
    tags: ["fastFood"],
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
    <td>SwiftUI</td>
  </tr>
  
  <tr>
  <td>

```swift
struct SwiftUIExampleView_WithCategories: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

    let options = SupportOptions(
        categories: [
            .init(
                tags: ["boba"],
                displayName: "Display Name Is Boba",
                displayColor: UIColor.blue
            ),
            .init(
                tags: ["fastFood"],
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
  </tr>
  <tr>
    <td>UIKit</td>
  </tr>
  <tr>
  <td>

```swift
class UIKitExampleControllerWithCategories: UIViewController {

    /**
     Connect this inside the storyboard.

     This is just for demo purposes, so it's not connected yet.
     */
    @IBAction func presentButtonPressed(_ sender: Any) {

        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

        var options = SupportOptions()
        let bobaCategory = SupportOptions.Category(
            tags: ["boba"],
            displayName: "Display Name Is Boba",
            displayColor: UIColor.blue
        )
        let fastFoodCategory = SupportOptions.Category(
            tags: ["fastFood"],
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

---

### Multiple Tags in One Category

<table>
  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result
  </td>
  </tr>
  <tr>
  <td>

```swift
let options = SupportOptions(
    categories: [
        .init(
            tags: ["boba", "fastFood"],
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

```swift
var options = SupportOptions()
let bobaAndFastFoodCategory = SupportOptions.Category(
    tags: ["boba", "fastFood"],
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
  </tr>
  <tr>
  <td>

```swift
struct SwiftUIExampleView_WithCategories: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

    let options = SupportOptions(
        categories: [
            .init(
                tags: ["boba", "fastFood"],
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
  </tr>
  <tr>
    <td>UIKit</td>
  </tr>
  <tr>
  <td>

```swift
class UIKitExampleController_WithCategories: UIViewController {

    /**
     Connect this inside the storyboard.

     This is just for demo purposes, so it's not connected yet.
     */
    @IBAction func presentButtonPressed(_ sender: Any) {

        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

        var options = SupportOptions()
        let bobaAndFastFoodCategory = SupportOptions.Category(
            tags: ["boba", "fastFood"],
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

---

## Navigation Bar

![Navigation Bar Preview](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/NavigationBarPreview.png)

### Title

<table>
  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result
  </td>
  
  </tr>

  <tr>
  <td>

```swift
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

```swift
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
    Result
  </td>
  
  </tr>

  <tr>
  <td>

```swift
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

```swift
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
    Result
  </td>
  
  </tr>

  <tr>
  <td>

```swift
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

```swift
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
    Result
  </td>
  
  </tr>

  <tr>
  <td>

```swift
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

```swift
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
    Result
  </td>
  
  </tr>

  <tr>
  <td>

```swift
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

```swift
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

![Progress Bar Preview](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/ProgressBarPreview.png)

### Foreground Color

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result
  </td>
  
  </tr>

  <tr>
  <td>

```swift
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

```swift
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
    Result
  </td>
  
  </tr>

  <tr>
  <td>

```swift
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

```swift
var options = SupportOptions()
options.progressBar.foregroundColor = UIColor.red
options.progressBar.backgroundColor = UIColor.blue
```

  </td>
  </tr>
</table>

## List Style

![List Style](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/ListStylePreview.png)

<table width="100%">
  <tr>
    <td>List Style</td>
    <td>Result</td>
  </tr>
  <tr>
    <td><code>.defaultListStyle</code></td>
    <td rowspan="5" style="text-align:center;"><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/defaultListStyle.png" width="160"></td>
  </tr>
  <tr>
    <td>SwiftUI</td>
  </tr>
  <tr>
<td>

```swift
let options = SupportOptions(
  listStyle: .defaultListStyle
)
```

</td>
  </tr>
  <tr>
    <td>UIKit</td>
  </tr>
  <tr>
<td>

```swift
var options = SupportOptions()
options.listStyle = .defaultListStyle
```

</td>
  </tr>
  <tr>
    <td><code>.plainListStyle</code></td>
    <td rowspan="5" style="text-align:center;"><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/plainListStyle.png" width="160"></td>
  </tr>
  <tr>
    <td>SwiftUI</td>
  </tr>
  <tr>
<td>

```swift
let options = SupportOptions(
  listStyle: .plainListStyle
)
```

</td>
  </tr>
  <tr>
    <td>UIKit</td>
  </tr>
  <tr>
<td>

```swift
var options = SupportOptions()
options.listStyle = .plainListStyle
```

</td>
  </tr>
  <tr>
    <td><code>.groupedListStyle</code></td>
    <td rowspan="5" style="text-align:center;"><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/groupedListStyle.png" width="160"></td>
  </tr>
  <tr>
    <td>SwiftUI</td>
  </tr>
  <tr>
<td>

```swift
let options = SupportOptions(
  listStyle: .groupedListStyle
)
```

</td>
  </tr>
  <tr>
    <td>UIKit</td>
  </tr>
  <tr>
<td>

```swift
var options = SupportOptions()
options.listStyle = .groupedListStyle
```

</td>
  </tr>
  <tr>
    <td><code>.insetGroupedListStyle</code></td>
    <td rowspan="5" style="text-align:center;"><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/insetGroupedListStyle.png" width="160"></td>
  </tr>
  <tr>
    <td>SwiftUI</td>
  </tr>
  <tr>
<td>

```swift
let options = SupportOptions(
  listStyle: .insetGroupedListStyle
)
```

</td>
  </tr>
  <tr>
    <td>UIKit</td>
  </tr>
  <tr>
<td>

```swift
var options = SupportOptions()
options.listStyle = .insetGroupedListStyle
```

</td>
  </tr>
  <tr>
    <td><code>.insetListStyle</code></td>
    <td rowspan="5" style="text-align:center;"><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/insetListStyle.png" width="160"></td>
  </tr>
  <tr>
    <td>SwiftUI</td>
  </tr>
  <tr>
<td>

```swift
let options = SupportOptions(
  listStyle: .insetListStyle
)
```

</td>
  </tr>
  <tr>
    <td>UIKit</td>
  </tr>
  <tr>
<td>

```swift
var options = SupportOptions()
options.listStyle = .insetListStyle
```

</td>
  </tr>
  <tr>
    <td><code>.sidebarListStyle</code></td>
    <td rowspan="5" style="text-align:center;"><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/ListStyle/sidebarListStyle.png" width="160"></td>
  </tr>
  <tr>
    <td>SwiftUI</td>
  </tr>
  <tr>
<td>

```swift
let options = SupportOptions(
  listStyle: .sidebarListStyle
)
```

</td>
  </tr>
  <tr>
    <td>UIKit</td>
  </tr>
  <tr>
<td>

```swift
var options = SupportOptions()
options.listStyle = .sidebarListStyle
```

</td>
  </tr>
</table>

## Navigation View Style

![Navigation View Style](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/NavigationStylePreview.png)

| Navigation View Style              | Portrait Result                                                                                                                                                    | Landscape Result                                                                                                                                                                    |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.defaultNavigationViewStyle`      | ![Default Navigation View Style (Portrait)](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Options/NavigationViewStyle/portraitNVS.png)       | ![Default Navigation View Style (Landscape)](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Options/NavigationViewStyle/defaultStyle_landscape.png)            |
| `.doubleColumnNavigationViewStyle` | ![Double Column Navigation View Style (Portrait)](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Options/NavigationViewStyle/portraitNVS.png) | ![Double Column Navigation View Style (Landscape)](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Options/NavigationViewStyle/doubleColumnStyle_landscape.png) |
| `.stackNavigationViewStyle`        | ![Stack Navigation View Style (Portrait)](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Options/NavigationViewStyle/portraitNVS.png)         | ![Stack Navigation View Style (Landscape)](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Options/NavigationViewStyle/stackStyle_landscape.png)                |

## Dark Mode

SupportDocs supports Dark Mode right out of the box! You don't need to do anything.

![Dark Mode Graphic](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/DarkMode.png)

## Other

![Other](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/OtherPreview.png)

| Parameter                | Type                            | Values                            | Default                              | Corresponding Graphic |
| ------------------------ | ------------------------------- | --------------------------------- | ------------------------------------ | --------------------- |
| `activityIndicatorStyle` | `UIActivityIndicatorView.Style` | `.large` or `.medium`             | `.medium`                            | Graphic #1            |
| `welcomeView`            | `AnyView`                       | --                                | `nil`                                | Graphic #2            |
| `footer`                 | `AnyView`                       | --                                | `nil`                                | Graphic #3            |
| `error404`               | `URL`                           | `URL(string: "404.example.com")!` | `URL(string: "https://google.com")!` | Graphic #4            |

-   `activityIndicatorStyle`: Style of the activity indicator, shown when the JSON is being downloaded
-   `welcomeView`: A custom view that will be shown that will be shown at first. If you are using the `defaultNavigationViewStyle` or `doubleColumnNavigationViewStyle`, this view will be shown if no row is selected
-   `footer`: A custom view you can add to the bottom of the list
-   `error404`: A web page to display in case something cannot be found
