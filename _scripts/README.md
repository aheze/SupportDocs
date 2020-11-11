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
      <a id="datasource_url" href="{{ datasource_url }}">{{ datasource_url }}</a>
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
      let dataSource = URL(string: "{{ datasource_url }}")!
      @State var supportDocsPresented = false
      
      var body: some View {
          Button("Present SupportDocs from SwiftUI!") { supportDocsPresented = true }
          .sheet(isPresented: $supportDocsPresented, content: {
              SupportDocsView(dataSource: dataSource, isPresented: $supportDocsPresented)
          })
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
        
          let dataSource = URL(string: "{{ datasource_url }}")!
        
          let supportDocsViewController = SupportDocsViewController(dataSource: dataSource)
          self.present(supportDocsViewController, animated: true, completion: nil)
      }
  }
  ```
  </td>
  </tr>
</table>

## Table of Contents
{{ table_of_contents }}

## Notes
- Your changes make take up to five minutes to deploy. You can track the deployment progress [here]({{ deployment_progress }}).
- Do **not** update this file (`README.md`) directly. Your changes will be overriden the next time you push (the GitHub action will re-generate this file). Instead, update the file in [`_scripts/README.md`]({{ editable_readme_url }}). 
