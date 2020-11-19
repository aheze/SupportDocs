# DataSource Branch
## Directory Listing
![DataSource File Listing](https://raw.githubusercontent.com/aheze/SupportDocs/main/Assets/Usage/Guide.png)

-   `.github/workflows`: Holds the GitHub Action which compiles your documents into a JSON file
-   `Images`: Contains the images used in the example documents
-   `Sample-Boba`: Contains all documents tagged with <kbd>boba</kbd>
-   `Sample-FastFood`: Contains all documents tagged with <kbd>fastFood</kbd>
-   `Sample-Smoothies`: Contains all documents tagged with <kbd>smoothies</kbd>
-   `_data`: Contains the generated data source URL
-   `_layouts`: Holds the base HTML that GitHub Pages uses
-   `_sass`: Holds the file where you can customize the look of the HTML, including light and dark mode colors (`_sass/_color-themes.scss`)
-   `_scripts`: Contains the script used by the GitHub Action, as well as the README template. This template is what you should edit if you want to change the README at all -- if you change it directly, your changes will be overriden.
-   `assets/css`: Applies the color theme declared in `_sass`
-   `.gitignore`: Tells git which files and directories to ignore
-   `404.md`: The 404 document that will be displayed if your URLs are wrong. You can also pass this into `options.other.error404` in case your data source URL fails
-   `README.md`: For your reference. It contains a link to the data source URL, and a table of contents that shows all your documents. **Do not** edit this file directly, instead, edit the file in `_scripts/README.md`.
-   `_config.yml`: Sets the default theme "Primer" for GitHub Pages. We recommend that you don't change this, as we customized dark mode specifically for the "Primer" theme. If you do change the theme, you'll need to reconfigure `assets/css/main.scss`.