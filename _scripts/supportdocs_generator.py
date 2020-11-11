"""
SupportDocs Generator
Contributors:
    :: H. Kamran [@hkamran80] (author)
Version: 1.1.0
Last Updated: 2020-11-10, @hkamran80
"""

import frontmatter
import jinja2
import codecs
import json
import os

DATA_JSON_FILE_PATH = "_data/supportdocs_datasource.json"
READ_README_FILE_PATH = "_scripts/README.md"
WRITE_README_FILE_PATH = "README.md"

DEVELOPER_MODE = os.environ.get("DEVELOPER_MODE", False)
if not DEVELOPER_MODE:
    GITHUB_USERNAME = os.environ.get("GITHUB_ACTOR")
    FULL_GITHUB_REPOSITORY = os.environ.get("GITHUB_REPOSITORY")
    GITHUB_REPOSITORY = FULL_GITHUB_REPOSITORY.split("/")[1]
    GITHUB_BRANCH = (
        os.environ.get("GITHUB_REF").split("/")[-1]
        if os.environ.get("GITHUB_REF")
        else GITHUB_REPOSITORY
    )
else:
    GITHUB_USERNAME = "demo"
    FULL_GITHUB_REPOSITORY = "demo/SupportDocs"
    GITHUB_REPOSITORY = FULL_GITHUB_REPOSITORY.split("/")[1]
    GITHUB_BRANCH = "refs/head/DataSource"


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
    if os.path.exists(os.path.abspath("_data/supportdocs_datasource.json")):
        os.remove(os.path.abspath("_data/supportdocs_datasource.json"))


if __name__ == "__main__":
    data = []

    remove_preexisting_data()

    directory_list = [
        directory
        for directory in next(os.walk("."))[1]
        if directory not in ("images", "Images", "Changelogs", "Example")
        and not directory.startswith("_")
        and not directory.startswith(".")
    ]

    for directory in directory_list:
        file_list = [
            file
            for file in os.listdir(os.path.abspath(directory))
            if file.endswith("md") and os.path.isfile(directory + "/" + file)
        ]
        for file in file_list:
            help_file_frontmatter = parse_markdown(
                os.path.abspath(directory + "/" + file)
            )

            try:
                help_file_tags = (
                    [tag.strip() for tag in help_file_frontmatter["tags"].split(",")]
                    if help_file_frontmatter["tags"] is not None
                    else []
                )
            except KeyError:
                help_file_tags = []

            add_help_file(
                help_file_frontmatter["title"],
                directory,
                file.replace(".md", ""),
                help_file_tags,
            )

    if not os.path.isdir(os.path.abspath("_data")):
        os.mkdir("_data")

    with open(DATA_JSON_FILE_PATH, "w") as data_json:
        data_json.write(json.dumps(data, indent=4))

    with open(READ_README_FILE_PATH, "r") as readme_file:
        readme = jinja2.Template(readme_file.read(), trim_blocks=True)

    toc = ""
    for support_document in sorted(data, key=lambda item: item["title"]):
        edit_link = f"https://github.com/{GITHUB_USERNAME}/{GITHUB_REPOSITORY}/edit/{GITHUB_BRANCH}/{'/'.join(support_document['url'].split('/')[-2:])}.md"
        toc += (
            f"- [{support_document['title']}]({support_document['url']})"
            + f" ({', '.join(support_document['tags']) if support_document['tags'] else 'No Tags'})"
            + f" ([edit]({edit_link}))\n"
        )

    deployment_progress = f"https://github.com/{GITHUB_USERNAME}/{GITHUB_REPOSITORY}/deployments/activity_log?environment=github-pages"
    editable_readme_url = f"https://github.com/{GITHUB_USERNAME}/{GITHUB_REPOSITORY}/edit/{GITHUB_BRANCH}/{READ_README_FILE_PATH}"
    datasource_url = (
        f"https://github.com/{FULL_GITHUB_REPOSITORY}".replace(
            "//github.com/", "//raw.githubusercontent.com/"
        ).replace("/blob/", "/")
        + f"/{GITHUB_BRANCH}/{DATA_JSON_FILE_PATH}"
    )

    rendered_readme = readme.render(
        datasource_url=datasource_url,
        table_of_contents=toc,
        deployment_progress=deployment_progress,
        editable_readme_url=editable_readme_url,
    )
    if not DEVELOPER_MODE:
        readme_output = codecs.open(WRITE_README_FILE_PATH, "w", "utf-8")
        readme_output.write(rendered_readme)
        readme_output.close()
    else:
        with open("README.tmp.md", "w") as tmp_readme:
            tmp_readme.write(rendered_readme)
