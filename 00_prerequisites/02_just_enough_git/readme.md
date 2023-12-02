python3 -m pip install pre-commit

pre-commit --version

pre-commit 3.5.0


 pre-commit install

pre-commit installed at .git/hooks/pre-commit

```
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v3.4.0  # Use the latest version
    hooks:
    -   id: trailing-whitespace
    -   id: end-of-file-fixer
    -   id: check-yaml
```

Instal YAML
pre-commit install

Test:
pre-commit run --all-files




mkdir -p .github/workflows


touch .github/workflows/pre_commit.yml

```
name: Pre-Commit

on: [push, pull_request]

jobs:
  pre-commit:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: actions/setup-python@v2
      with:
        python-version: '3.x'
    - name: Install pre-commit
      run: pip install pre-commit
    - name: Run pre-commit on all files
      run: pre-commit run --all-files
```


git add .github/workflows/pre_commit.yml
git commit -m "Add GitHub Actions workflow for pre-commit"
git push
