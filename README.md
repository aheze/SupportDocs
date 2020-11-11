# SupportDocs: DataSource
This is where SupportDocs gets its data!

## Data Source JSON URL
<a href="https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json">https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json</a>

## Examples
### SwiftUI
```swift
struct SwiftUIExampleView_MinimalCode: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    @State var supportDocsPresented = false
    
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            SupportDocsView(dataSource: dataSource, isPresented: $supportDocsPresented)
        })
    }
}
```

### UIKit
```swift
class UIKitExampleController_MinimalCode: UIViewController {
    /**
    Connect this inside the storyboard.
    
    This is just for demo purposes, so it's not connected yet.
    */
    @IBAction func presentButtonPressed(_ sender: Any) {
        let dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
        let supportDocsViewController = SupportDocsViewController(dataSource: dataSource)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}
```

## Table of Contents
- [2 tags test](https://aheze.github.io/SupportDocs/Sample-Smoothies/twoTagsTest) (firstTag, secondTag) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/twoTagsTest.md))
- [Apple smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Apple) (smoothies) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/Apple.md))
- [Blueberry Smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Blueberry) (smoothies) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/Blueberry.md))
- [Buy blue boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyBlueBoba) (boba) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Boba/BuyBlueBoba.md))
- [Buy cream boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyCreamBoba) (boba) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Boba/BuyCreamBoba.md))
- [Buy orange boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyOrangeBoba) (boba) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Boba/BuyOrangeBoba.md))
- [How to Cook Pizza](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToCookPizza) (fastFood) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToCookPizza.md))
- [How to Prepare Ramen](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToPrepareRamen) (fastFood) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToPrepareRamen.md))
- [How to eat burritos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatBurritos) (fastFood) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatBurritos.md))
- [How to eat grilled cheese](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatGrilledCheese) (fastFood) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatGrilledCheese.md))
- [How to eat nachos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatNachos) (fastFood) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatNachos.md))
- [How to eat tacos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatTacos) (fastFood) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatTacos.md))
- [How to make spaghetti](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToMakeSpaghetti) (fastFood) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToMakeSpaghetti.md))
- [Markdown Test 2 in folder](https://aheze.github.io/SupportDocs/Sample-Smoothies/FolderMarkdownTest) (other) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/FolderMarkdownTest.md))
- [No tags at all](https://aheze.github.io/SupportDocs/Sample-Smoothies/noTagsAtAll) (No Tags) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/noTagsAtAll.md))
- [Peach smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Peach) (smoothies) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/Peach.md))
- [Plum smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Plum) (smoothies) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/Plum.md))
- [Red berry smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/RedBerries) (smoothies) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/RedBerries.md))
- [empty tags test](https://aheze.github.io/SupportDocs/Sample-Smoothies/emptyTagsTest) (No Tags) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/emptyTagsTest.md))


## Notes
- Your changes make take up to five minutes to deploy. You can track the deployment progress [here](https://github.com/aheze/SupportDocs/deployments/activity_log?environment=github-pages).
- Do **not** update this file (`README.md`) directly. Your changes will be overriden the next time you push (the GitHub Action will regenerate this file). Instead, update the file in [`_scripts/README.md`](https://github.com/aheze/SupportDocs/edit/DataSource/_scripts/README.md). 