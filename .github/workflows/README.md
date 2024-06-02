# GitHub Actions Workflows
This directory contains the GitHub Actions workflows that are used with the project.

| Workflow         | Description                                                                             |
|------------------|-----------------------------------------------------------------------------------------|
| `codeql.yml`     | Run CodeQL analysis on the codebase to check for vulnerabilities.                       |
| `sonarcloud.yml` | Run SonarCloud analysis on the codebase to check for bugs and security vulnerabilities. |
| `.hound.yml`     | Run Hound to lint the codebase and comments inline with any issues.                     |
| `DCO`            | Check that all commits have a DCO sign-off.                                             |
| `semantic.yml`   | Check that all commits & PR's have a semantic message.                                  |


## Semantic PRs*
The semantic check ensures that all commits and PRs have a semantic message. For more information on semantic messages, see the [Conventional Commit Guidelines](../../docs/contributors/DEV_GUIDE.md#conventional-commit-guidelines) section of this guide.

## DCO
The DCO check ensures that all commits in the PR have a DCO sign-off. For more information on the DCO, see the [Commit Sign-off](../../docs/contributors/DEV_GUIDE.md#commit-sign-off) section.

## Hound
Hound is a linter that checks for style violations in the codebase. The Hound analysis is run on every PR to ensure that the codebase adheres to the style guidelines.

## SonarCloud
SonarCloud is a static code analysis tool that checks for code smells, bugs, and security vulnerabilities. The SonarCloud analysis is run on every PR to ensure that the codebase is free of bugs and security vulnerabilities.

## CodeQL
CodeQL is a semantic code analysis engine that allows you to write queries to find vulnerabilities in your codebase. The CodeQL analysis is run on every PR to ensure that the codebase is free of vulnerabilities.
