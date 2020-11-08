# SupportDocs: DataSource
This is where SupportDocs gets its data!

<table>
  <tr>
    <td>
      <strong>Your data source JSON url is:
    </td>
  </tr>
  <tr>
    <td>
      <a id="datasource_url" href="https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json">https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json</a>
    </td>
  </tr>
</table>

<table>
  <tr>
    <td>
      How to use (SwiftUI)
    </td>
  </tr>
  <tr>
  <td>
     
  ```Swift
  struct SwiftUIExampleView_MinimalCode: View {
    
      let options = SupportOptions(
          urls: .init(
              dataSource: URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
          )
      )
    
      @State var supportDocsPresented = false
    
      var body: some View {
          VStack {
              Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
              .sheet(isPresented: $supportDocsPresented, content: {
                  SupportDocsView(options: options, isPresented: $supportDocsPresented)
              })
          }
      }
  }
  ```
  </td>
  </tr>
  
  <tr>
    <td>
      How to use (UIKit)
    </td>
  </tr>
  <tr>
  <td>
     
  ```Swift
  class UIKitExampleController_MinimalCode: UIViewController {
    
      /**
       Connect this inside the storyboard.
     
       This is just for demo purposes, so it's not connected yet.
       */
      @IBAction func presentButtonPressed(_ sender: Any) {
        
          var options = SupportOptions()
          options.urls.dataSource = URL(string: "https://raw.githubusercontent.com/aheze/SupportDocs/DataSource/_data/supportdocs_datasource.json")!
        
          let supportDocsViewController = SupportDocsViewController(options: options)
          self.present(supportDocsViewController, animated: true, completion: nil)
      }
  }
  ```
  </td>
  </tr>
</table>

## Table of Contents
- [How to eat grilled cheese](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatGrilledCheese) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatGrilledCheese.md))
- [How to make spaghetti](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToMakeSpaghetti) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToMakeSpaghetti.md))
- [How to eat burritos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatBurritos) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatBurritos.md))
- [How to eat tacos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatTacos) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatTacos.md))
- [How to eat nachos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatNachos) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToEatNachos.md))
- [How to Prepare Ramen](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToPrepareRamen) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToPrepareRamen.md))
- [How to Cook Pizza](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToCookPizza) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-FastFood/HowToCookPizza.md))
- [Plum smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Plum) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/Plum.md))
- [Peach smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Peach) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/Peach.md))
- [Blueberry Smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Blueberry) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/Blueberry.md))
- [Red berry smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/RedBerries) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/RedBerries.md))
- [Apple smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Apple) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Smoothies/Apple.md))
- [Buy cream boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyCreamBoba) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Boba/BuyCreamBoba.md))
- [Buy blue boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyBlueBoba) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Boba/BuyBlueBoba.md))
- [Buy orange boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyOrangeBoba) ([edit](https://github.com/aheze/SupportDocs/edit/DataSource/Sample-Boba/BuyOrangeBoba.md))


*Note: Your changes make take up to 5 minutes to update. You can track the progress [here](https://github.com/aheze/SupportDocs/deployments/activity_log?environment=github-pages).*

## Warning
Do **not** update this file (`README.md`) directly. Your changes will be overriden the next time you push (the GitHub action will re-generate this file). Instead, update the file in `_scripts/README.md`. 