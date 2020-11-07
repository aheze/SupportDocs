"""
Data Source Generator
Contributors:
    :: H. Kamran [@hkamran80] (author)
Version: 1.1.0
Last Updated: 2020-11-06, @hkamran80
"""

import frontmatter
import jinja2
import codecs
import json
import os

GITHUB_USERNAME = os.environ.get("GITHUB_ACTOR")
FULL_GITHUB_REPOSITORY = os.environ.get("GITHUB_REPOSITORY")
GITHUB_REPOSITORY = FULL_GITHUB_REPOSITORY.split("/")[1]
DATA_JSON_FILE_PATH = "_data/data.json"
READ_README_FILE_PATH = "_scripts/README.md"
WRITE_README_FILE_PATH = "README.md"


def add_help_file(title: str, directory: str, filename: str, tags: list):
    data.append(
        {
            "title": title,
            "url": f"https://{GITHUB_USERNAME}.github.io/{GITHUB_REPOSITORY}/{directory}/{filename}",
            "tags": tags,
        }
    )


def parse_markdown(path: str):
    with open(path) as md:
        metadata = frontmatter.load(md).metadata

    return metadata


def remove_preexisting_data():
    if os.path.exists(os.path.abspath("_data/data.json")):
        os.remove(os.path.abspath("_data/data.json"))

if __name__ == "__main__":
    data = []

    remove_preexisting_data()

    directory_list = [
        directory
        for directory in next(os.walk("."))[1]
        if directory not in ("images", "Images", "Changelogs")
        and not directory.startswith("_")
        and not directory.startswith(".")
    ]

    for directory in directory_list:
        for file in os.listdir(os.path.abspath(directory)):
            help_file_frontmatter = parse_markdown(
                os.path.abspath(directory + "/" + file)
            )
            add_help_file(
                help_file_frontmatter["title"],
                directory,
                file.replace(".md", ""),
                [tag.strip() for tag in help_file_frontmatter["tags"].split(",")],
            )

    if not os.path.isdir(os.path.abspath("_data")):
        os.mkdir("_data")

    with open(DATA_JSON_FILE_PATH, "w") as data_json:
        data_json.write(json.dumps(data, indent=4))

    with open(READ_README_FILE_PATH, "r") as readme_file:
        readme = jinja2.Template(readme_file.read(), trim_blocks=True)

    rendered_readme = readme.render(datasource_url=f"https://github.com/{FULL_GITHUB_REPOSITORY}".replace("//github.com/", "//raw.githubusercontent.com/").replace("/blob/", "/"))
    readme_output = codecs.open(WRITE_README_FILE_PATH, "w", "utf-8")
    readme_output.write(rendered_readme)
    readme_output.close()
