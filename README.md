# SupportDocs: DataSource
This is where SupportDocs gets its data!

## Data Source JSON URL
<a href="https://raw.githubusercontent.com/hkamran80/SupportDocs/DataSource/_data/supportdocs_datasource.json">https://raw.githubusercontent.com/hkamran80/SupportDocs/DataSource/_data/supportdocs_datasource.json</a>

## Examples: SwiftUI
```swift
struct SwiftUIExampleView_MinimalCode: View {
    let dataSource = URL(string: "https://raw.githubusercontent.com/hkamran80/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    @State var supportDocsPresented = false
    
    var body: some View {
        Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
        .sheet(isPresented: $supportDocsPresented, content: {
            SupportDocsView(dataSource: dataSource, isPresented: $supportDocsPresented)
        })
    }
}
```

## Examples: UIKit
```swift
class UIKitExampleController_MinimalCode: UIViewController {
    /**
    Connect this inside the storyboard.
    
    This is just for demo purposes, so it's not connected yet.
    */
    @IBAction func presentButtonPressed(_ sender: Any) {
        let dataSource = URL(string: "https://raw.githubusercontent.com/hkamran80/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
    
        let supportDocsViewController = SupportDocsViewController(dataSource: dataSource)
        self.present(supportDocsViewController, animated: true, completion: nil)
    }
}
```

## Table of Contents
- [Apple smoothie](https://hkamran80.github.io/SupportDocs/Sample-Smoothies/Apple) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-Smoothies/Apple.md))
- [Blueberry Smoothie](https://hkamran80.github.io/SupportDocs/Sample-Smoothies/Blueberry) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-Smoothies/Blueberry.md))
- [Buy blue boba](https://hkamran80.github.io/SupportDocs/Sample-Boba/BuyBlueBoba) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-Boba/BuyBlueBoba.md))
- [Buy cream boba](https://hkamran80.github.io/SupportDocs/Sample-Boba/BuyCreamBoba) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-Boba/BuyCreamBoba.md))
- [Buy orange boba](https://hkamran80.github.io/SupportDocs/Sample-Boba/BuyOrangeBoba) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-Boba/BuyOrangeBoba.md))
- [How to Cook Pizza](https://hkamran80.github.io/SupportDocs/Sample-FastFood/HowToCookPizza) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-FastFood/HowToCookPizza.md))
- [How to Prepare Ramen](https://hkamran80.github.io/SupportDocs/Sample-FastFood/HowToPrepareRamen) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-FastFood/HowToPrepareRamen.md))
- [How to eat burritos](https://hkamran80.github.io/SupportDocs/Sample-FastFood/HowToEatBurritos) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatBurritos.md))
- [How to eat grilled cheese](https://hkamran80.github.io/SupportDocs/Sample-FastFood/HowToEatGrilledCheese) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatGrilledCheese.md))
- [How to eat nachos](https://hkamran80.github.io/SupportDocs/Sample-FastFood/HowToEatNachos) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatNachos.md))
- [How to eat tacos](https://hkamran80.github.io/SupportDocs/Sample-FastFood/HowToEatTacos) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatTacos.md))
- [How to make spaghetti](https://hkamran80.github.io/SupportDocs/Sample-FastFood/HowToMakeSpaghetti) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-FastFood/HowToMakeSpaghetti.md))
- [Peach smoothie](https://hkamran80.github.io/SupportDocs/Sample-Smoothies/Peach) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-Smoothies/Peach.md))
- [Plum smoothie](https://hkamran80.github.io/SupportDocs/Sample-Smoothies/Plum) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-Smoothies/Plum.md))
- [Red berry smoothie](https://hkamran80.github.io/SupportDocs/Sample-Smoothies/RedBerries) ([edit](https://github.com/hkamran80/SupportDocs/edit/DataSource/Sample-Smoothies/RedBerries.md))


## Notes
- Your changes make take up to five minutes to deploy. You can track the deployment progress [here](https://github.com/hkamran80/SupportDocs/deployments/activity_log?environment=github-pages).
- Do **not** update this file (`README.md`) directly. Your changes will be overriden the next time you push (the GitHub Action will regenerate this file). Instead, update the file in [`_scripts/README.md`](https://github.com/hkamran80/SupportDocs/edit/DataSource/_scripts/README.md). 