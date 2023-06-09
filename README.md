# release_notes_generator plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-generate_release_notes)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-generate_release_notes`, add it to your project by running updating your Gemfile to include this line 

```bash
gem "fastlane-plugin-generate_release_notes", git: "https://github.com/Backbase/fastlane-plugin-release_notes_generator"
```

Then be sure to install the gems by running 
```bash
bundle install
```


## About release_notes_generator

A fastlane plugin that creates release notes following a particular format specified by the team

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example
In your Fastfile call the `generate_release_notes` action, you can pass the the following parameters
 - `format` either `json` or `md` for json and markdown, defaults to `json`
 - `version` the version the release, this will default to `x.y.z`

 ```ruby
    generate_release_notes(format: "json", version: "0.2.1")
 ```

 When the plugin is run successfully, for
 - `format: "json"` , the `RELEASE_NOTES.json` will be updated the placeholder detail as below

    ```json
    [
      {
        "version": "X.Y.Z",
        "description": "A short introduction to the release, whether it's a minor, major or breaking release",
        "new_features": [
          "List all new features here"
        ],
        "bug_fixes": [
          "List all bug fixes here"
        ],
        "breaking_changes": [
          "List all breaking changes here"
        ],
        "deprecations": [
          "List all deprecations here"
        ],
        "migration_steps": [
          "A detailed guide on how to migrate to this version from an earlier version"
        ],
        "security_advisory": [
          "Any security advisories"
        ]
      }
    ]
    ```
  - `format: "md"`, the `RELEASE_NOTES.md` will be updated the placeholder detail as below

    ```markdown
    ## [vX.Y.Z]
    A short introduction to the release, whether it's a minor, major or breaking release

    ### New / Added
    - List all new features here

    ### Bug fixes
    - List all bug fixes here

    ### Breaking changes
    - List all breaking changes here

    ### Deprecations / Updates
    - List all deprecations here

    ### Migration Steps
    - A detailed guide on how to migrate to this version from an earlier version
    ```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
