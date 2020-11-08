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
- [How to eat grilled cheese](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatGrilledCheese)
- [How to make spaghetti](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToMakeSpaghetti)
- [How to eat burritos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatBurritos)
- [How to eat tacos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatTacos)
- [How to eat nachos](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToEatNachos)
- [How to Prepare Ramen](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToPrepareRamen)
- [How to Cook Pizza](https://aheze.github.io/SupportDocs/Sample-FastFood/HowToCookPizza)
- [Plum smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Plum)
- [Peach smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Peach)
- [Blueberry Smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Blueberry)
- [Red berry smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/RedBerries)
- [Apple smoothie](https://aheze.github.io/SupportDocs/Sample-Smoothies/Apple)
- [Buy cream boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyCreamBoba)
- [Buy blue boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyBlueBoba)
- [Buy orange boba](https://aheze.github.io/SupportDocs/Sample-Boba/BuyOrangeBoba)


*Note: Your changes make take up to 5 minutes to update. You can track the progress [here]().*

## Warning
Do **not** update this file (`README.md`) directly. Your changes will be overriden the next time you push (the GitHub action will re-generate this file). Instead, update the file in `_scripts/README.md`. 