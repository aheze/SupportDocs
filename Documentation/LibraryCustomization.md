# Library Customization

![SupportOptions Graphic](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/CustomizableOptions.png)

Almost everything in the SupportDocs library can be customized through the `SupportOptions` struct. To use, just make an instance of `SupportOptions` and configure what you want!

<table>
<tr>
<td>
<strong>SwiftUI</strong>
</td>
<td>
<strong>UIKit</strong>
</td>
</tr>
<tr>
<td>
  
```Swift
import SwiftUI
import SupportDocs

struct ContentView: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    let options = SupportOptions(
        navigationBar: .init(
            title: "Support" /// Set navigation bar title to "Support"
        ),
        listStyle: .insetGroupedListStyle, /// Inset grouped list style (iOS 14+)
        other: .init(
            activityIndicatorStyle: UIActivityIndicatorView.Style.large, /// Large loading indicator
            error404: URL(string: "https://aheze.github.io/SupportDocs/404")! /// Custom 404 page (inside the DataSource branch)
        )
    )

    @State var supportDocsPresented: Bool = false
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            SupportDocsView(dataSource: dataSource, options: options, isPresented: $supportDocsPresented)
        })
    }
}
```
</td>
<td>
  
```Swift
class ViewController: UIViewController {
    
    @IBOutlet weak var presentButton: UIButton! /// Connect these in the storyboard.
    @IBAction func presentButtonPressed(_ sender: Any) {
        
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!

        // MARK: - UIKit way to make `SupportOptions`
        var options = SupportOptions()
        options.navigationBar.title = "Support" /// Set navigation bar title to "Support"
        options.listStyle = .insetGroupedListStyle /// Inset grouped list style (iOS 14+)
        options.other.activityIndicatorStyle = .large /// Large loading indicator
        options.other.error404 = URL(string: "https://aheze.github.io/SupportDocs/404")! /// Custom 404 page (inside the DataSource branch)

        let supportDocsViewController = SupportDocsViewController(dataSourceURL: dataSource, options: options)
        self.present(supportDocsViewController, animated: true, completion: nil)
        
    }
}
```
</td>
</tr>
</table>

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

## Examples
Here's some sample configurations to get you started.

### SwiftUI
-   [MinimalSupportDocs.swift](Examples/SwiftUI/MinimalSupportDocs.swift) -- the least code that you need to write. No `SupportOptions` are set.
-   [SupportDocsWithCategories.swift](Examples/SwiftUI/SupportDocsWithCategories.swift) -- displays 2 categories, one for all documents tagged with `boba`, the other `fastFood`. No other `SupportOptions` are set.
-   [SupportOptions.swift](Examples/SwiftUI/SupportOptions.swift) -- sets every single property inside `SupportOptions`, including a category of all documents tagged with `boba`.

### UIKit
-   [MinimalSupportDocs.swift](Examples/UIKit/MinimalSupportDocs.swift) -- the least code that you need to write. No `SupportOptions` are set.
-   [SupportDocsWithCategories.swift](Examples/UIKit/SupportDocsWithCategories.swift) -- displays 2 categories, one for all documents tagged with `boba`, the other `fastFood`. No other `SupportOptions` are set.
-   [SupportOptions.swift](Examples/UIKit/SupportOptions.swift) -- sets every single property inside `SupportOptions`, including a category of all documents tagged with `boba`.

## Categories

Group multiple documents in the same section. You make a category by specifying the tag(s), display name, and (optionally) color of the text in the category. 

![Categories Preview](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/CategoriesPreview.png)

### Important: Before You Begin

Make sure you have added the correct tags to the front matter inside your documents. See the [Tag Your Documents](../README.md#tag-your-documents) section of the README.

### No Categories

By default, the categories are set to `nil`, and every single document is displayed no matter their tags.

<kbd><img src="https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Categories/noCategories.png" width="200"></kbd>

---

### One Category

Here’s how to make SupportDocs display one category that contains all documents with the tag `boba`:

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
            displayName: "Display name is boba",
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
    displayName: "Display name is boba",
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
                displayName: "Display name is boba",
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
            displayName: "Display name is boba",
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

### Two Categories
This will display 2 categories, one for documents tagged with `boba` and another for those tagged with `fastFood`.

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
            displayName: "Display name is boba",
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
    displayName: "Display name is boba",
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
                displayName: "Display name is boba",
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
            displayName: "Display name is boba",
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
You can even combine multiple documents with different tags in the same category!

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
This is the bar that's shown at the top of the screen. You can customize quite a lot of its elements.

![Navigation Bar Preview](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/OptionsPreview/NavigationBarPreview.png)

### Title
The title to display.

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
The color of the title.

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

### Dismiss Button View / Dismiss Button Title
This is what will be shown as the dismiss button (press to dismiss SupportDocs). It's a bit more tricky. By default, you pass in an `AnyView` of your choice. This should either be an `Image` or a `Text`, but you can experiment with other elements. For example, both of these will work:

<table>
<tr>
<td>

`Image`
</td>
<td>

`Text`
</td>
</tr>
<tr>
<td>
  
```Swift
AnyView(Image(systemName: "xmark")) /// SF Symbols are best
```
</td>
<td>
  
```Swift
AnyView(Text("I Am Finished"))  /// `Text` works just as well
```
</td>
</tr>
</table>

You then pass it into `SupportOptions`'s `navigationBar.dismissButtonView` parameter.

<table>

  <tr>
  <td>
    SwiftUI
  </td>
  <td>
    Result　　　　　　　　　　<!-- 10 CJK spaces to the left to force a reasonably large image. DO NOT delete. -->
  </td>
  
  </tr>

  <tr>
  <td>

```swift
let options = SupportOptions(
  navigationBar: .init(
    dismissButtonView: AnyView(Text("I Am Finished"))  /// or, AnyView(Image(systemName: "xmark"))
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
options.navigationBar.dismissButtonView = AnyView(Text("I Am Finished")) /// or, AnyView(Image(systemName: "xmark"))
```

  </td>
  </tr>
</table>

However, if you're using SwiftUI, you have the option of supplying a plain `String` instead. This is a little easier to read than `AnyView`, but is limited to a `String` and SwiftUI.


```swift
let options = SupportOptions(
  navigationBar: .init(
    dismissButtonTitle: "I Am Finished" /// Just a normal String
  )
)
```

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
