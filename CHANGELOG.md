# Changelog

All notable Changed to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.1] - 2023-02-03

### Changed

- Adiciona workflow de deployment padronizado ao projeto por @danilogco
- Adiciona o Ruby v3.2.0 para a matriz de testes unitários por @danilogco

## [1.0.0] - 2023-01-02

### Added

- Update project to run ruby v3.2.0 by @danilogco
- Update project dependencies and tag stable release by @danilogco

## [0.3.2] - 2022-06-13

### Changed

- build(deps): bump bigid_auth version from 0.2.1 to 0.2.2 #31

## [0.3.1.3] - 2022-05-06

### Added

- feat: automatize the project deployment proccess

### Changed

- build(deps): bump ruby version from 3.1.0 to 3.1.2
- build(deps): bump bigid_auth version to v0.2.1.4

## [0.3.1.1] - 2022-02-09

### Changed

- bump bigid_auth version to v0.2.1.1

## [0.3.1] - 2022-02-02

### Changed

- [QC-79](https://qflash.atlassian.net/jira/software/projects/QC/boards/31?selectedIssue=QC-79)
Reduzir uso de pipelines em projetos Ruby [Dependabot]
- Bump Ruby version to v3.1.0

## [0.3.0]

### Changed

- Bump "bigid_auth" version from v0.1.0 to v0.2.0

## [0.2.0]

### Added

- Add fields to service return: "raw_data", "score_details", "related_score_details" and "raw_response" (the complete json file)

## [0.1.3]

### Fixed

- Fix a problem with the locale initialization in Rails projects

## [0.1.2]

### Changed

- Move auth service to an external package

## [0.1.1]

### Fixed

- Fix a problem with the credentials when its get by the env variables
- Fix rubocop warnings

## [0.1.0]

### Added

- Initial release of bigid_bgcheck
