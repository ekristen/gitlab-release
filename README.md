**IMPORTANT:** If you are viewing this on GitHub, you are viewing a mirror of the [GitLab project](https://gitlab.com/ekristen/gitlab-release).

# GitLab Release

This is a simple bash script designed to run in GitLab CI when tags are pushed to a project to create a release if it does not exist and upload files against the release.

## Overview

The idea is very simple, specify a path where release files are located (via `GR_RELEASE_PATH` env var ) that need to be uploaded against a release. Then define a publish files/binaries job in your `.gitlab-ci.yml` file and sit back and watch your release assets get published automatically when you push a tag.

## Caveats

Unfortunately the `CI_JOB_TOKEN` does not have enough privileges at this time to allow upload of assets or to create a release, so you will need to specify one from an account that has high privileges via the `GR_TOKEN` env var in your GitLab CI/CD Settings for the Project or Group that the project belongs to.

## Usage

This is designed to be run as a docker container with GitLab CI. 

### GitLab CI Example Job

```
publish:binaries:
  stage: publish
  image: ekristen/gitlab-release:latest
  cache:
    key: ${CI_COMMIT_REF_SLUG}
    paths:
      - release/
    policy: pull
  variables:
    GIT_STRATEGY: none
  script:
    - gitlab-release
  only:
    refs:
      - tags
```

### Development

You can mimic the GitLab CI environment by ensuring all the necessary env vars are set. Specifically `GR_TOKEN`, `CI_PROJECT_ID` and `CI_COMMIT_TAG`. If you wish to debug the script, simply set `DEBUG` to any value.
