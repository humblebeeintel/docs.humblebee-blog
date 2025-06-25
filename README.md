# Humblebee AI - Blog

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/bybatkhuu/docs.humblebee-blog/4.publish-docs.yml?logo=GitHub)](https://github.com/bybatkhuu/docs.humblebee-blog/actions/workflows/4.publish-docs.yml)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/bybatkhuu/docs.humblebee-blog?logo=GitHub&color=blue)](https://github.com/bybatkhuu/docs.humblebee-blog/releases)

This repository is for "blog.humblebee.ai" technical blog.

## ✨ Features

- Technical blog
- MkDocs Material
- Markdown support
- Static site generator

---

## 🛠 Installation

### 1. 🚧 Prerequisites

- Install **Python (>= v3.10)** and **pip (>= 23)**:
    - **[RECOMMENDED] [Miniconda (v3)](https://www.anaconda.com/docs/getting-started/miniconda/install)**
    - *[arm64/aarch64] [Miniforge (v3)](https://github.com/conda-forge/miniforge)*
    - *[Python virutal environment] [venv](https://docs.python.org/3/library/venv.html)*

[OPTIONAL] For **DEVELOPMENT** environment:

- Install [**git**](https://git-scm.com/downloads)
- Setup an [**SSH key**](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) ([video tutorial](https://www.youtube.com/watch?v=snCP3c7wXw0))

### 2. 📥 Download or clone the repository

**2.1.** Prepare projects directory (if not exists):

```sh
# Create projects directory:
mkdir -pv ~/workspaces/projects

# Enter into projects directory:
cd ~/workspaces/projects
```

**2.2.** Follow one of the below options **[A]**, **[B]** or **[C]**:

**OPTION A.** Clone the repository:

```sh
git clone https://github.com/humblebeeintel/docs.humblebee-blog.git && \
    cd docs.humblebee-blog
```

**OPTION B.** Clone the repository (for **DEVELOPMENT**: git + ssh key):

```sh
git clone git@github.com:humblebeeintel/docs.humblebee-blog.git && \
    cd docs.humblebee-blog
```

**OPTION C.** Download source code:

1. Download archived **zip** file from [**releases**](https://github.com/humblebeeintel/docs.humblebee-blog/releases).
2. Extract it into the projects directory.

### 3. 📦 Install dependencies

```sh
# Install 'mkdocs-material' and other dependencies:
pip install -r ./requirements.txt
```

### 4. 🏁 Run the documentation server locally (for DEVELOPMENT)

```sh
mkdocs serve -a 0.0.0.0:8000
# Or:
./scripts/docs.sh
```

### 5. 🌐 Check the documentation in web browser

- <http://localhost:8000>

### 6. 🏗️ Generate the HTML documentation files (static site)

```sh
mkdocs build
# Or:
./scripts/build.sh

# Check the generated HTML files (it should be in the `site` directory):
ls -al ./site
```

### 7. 🚀 Deploy the documentation

```sh
# Copy the generated HTML files to the web server:
cp -r ./site/* /var/www/blog.humblebee.ai/public
# Or use rsync:
rsync -av --delete ./site/ /var/www/blog.humblebee.ai/public/

# Or deploy the documentation to GitHub Pages (default branch: gh-pages) of this repository:
mkdocs gh-deploy --force
# Or:
./scripts/build.sh -p
```

👍

---

## 📑 References

- <https://squidfunk.github.io/mkdocs-material>
- <https://squidfunk.github.io/mkdocs-material/getting-started>
- <https://www.mkdocs.org>
- <https://pypi.org/project/mkdocs-material>
- <https://github.com/mkdocs/catalog>
- <https://github.com/jimporter/mike>
- <https://mkdocstrings.github.io>
- <https://lukasgeiter.github.io/mkdocs-awesome-nav>
- <https://oprypin.github.io/mkdocs-literate-nav>
- <https://github.com/bharel/mkdocs-render-swagger-plugin>
- <https://blueswen.github.io/mkdocs-swagger-ui-tag>
