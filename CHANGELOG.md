# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
[markdownlint](https://dlaa.me/markdownlint/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.4] - 2021-02-03

### Added in 0.2.4

- `SshUsername` output variable

### Changed in 0.2.4

- Updated to latest Docker images
  - senzing/init-container:1.6.5
  - senzing/stream-loader:1.7.0
  - senzing/stream-producer:1.3.1
  - senzing/entity-search-web-app:2.2.1
- Changed output variable names to collate better
  - `ApiServerHeartbeatUrl` is now `UrlApiServerHeartbeat`
  - `JupyterUrl` is now `UrlJupyter`
  - `SwaggerUrl` is now `UrlSwagger`
  - `WebAppUrl` is now `UrlWebApp`
  - `XtermUrl` is now `UrlXterm`
- Modified host in URLs from `senzing.github.io` to `hub.senzing.com`

## [0.2.3] - 2021-01-21

### Fixed in 0.2.3

- Changed ARN references
- Added AccountID output

## [0.2.2] - 2021-01-05

### Fixed in 0.2.2

- Modified DependsOn values
- Disabled Public IP addresses

## [0.2.1] - 2021-01-04

### Fixed in 0.2.1

- Modified DependsOn values
- Disabled Jupyter by default.  Keeps crashing.
- Added missing Tags

## [0.2.0] - 2020-12-31

### Added to 0.2.0

- Support Senzing database cluster
- Autoscale Senzing API Server and Entity Search Web App
- Generate random password for SSHD container
- Remove Key/Value pairs that specify default values

## [0.1.0] - 2020-12-30

### Added to 0.1.0

- Base functionality
- For testing, all services active
- Single AWS Aurora Postgres Serverless database
