# Contributing

## Code of Conduct

Before contributing to this project, please read our [code of conduct](.github/CODE_OF_CONDUCT.md).

## CI/CD Pipelines

We are using [GitHub Actions](https://github.com/features/actions) as a continuous integration system.

For details, take a look at the following workflow configuration files:

- [`workflows/lint.yaml`](.github/workflows/lint.yml)

## Coding Standards

We are using [`yamllint`](https://github.com/adrienverge/yamllint) to enforce coding standards in YAML files.

Run

```sh
make cs
```

to automatically detect coding standard violations.

## Help

:bulb: Run

```sh
make help
```

to display a list of available targets with corresponding descriptions.
