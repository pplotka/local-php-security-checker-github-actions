# GitHub Actions for Local PHP Security Checker

Run [Local PHP Security Checker](https://github.com/fabpot/local-php-security-checker) via GitHub Actions. 

## How to use
```yaml
name: Security scanner

on: [push, pull_request]

jobs:
  psalm:
    name: Local PHP Security Checker
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Local PHP Security Checker
        uses: docker://pplotka/local-php-security-checker-github-actions
```

You can specify version of Local PHP Security Checker:

```diff
      - name: Local PHP Security Checker
-       uses: docker://pplotka/local-php-security-checker-github-actions
+       uses: docker://pplotka/local-php-security-checker-github-actions:v1.0.0
```

You can also pass a `path` to check a specific directory:
```diff
      - name: Local PHP Security Checker
        uses: docker://pplotka/local-php-security-checker-github-actions
+       with:
+         path: path/to/php/project/composer.lock
```

By default, the output is optimized for terminals, change it via the `format` parameter (supported formats: `ansi`, `markdown`, `json`, and `yaml`):
```diff
      - name: Local PHP Security Checker
        uses: docker://pplotka/local-php-security-checker-github-actions
+       with:
+         format: markdown
```

## Use without GitHub Actions
The Docker Image is located here: https://hub.docker.com/r/pplotka/local-php-security-checker-github-actions

You can run checking any directory with `composer.lock` file with this command:

```shell
docker run --rm -it -w /app -v $(pwd):/app pplotka/local-php-security-checker-github-actions --format=yaml
```
