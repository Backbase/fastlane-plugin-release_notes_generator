require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?(:UI)

  module Helper
    class GenerateReleaseNotesHelper
      # class methods that you define here become available in your action
      # as `Helper::GenerateReleaseNotesHelper.your_method`

      RELEASE_NOTES_MD_FILE = "./RELEASE_NOTES.md"
      RELEASE_NOTES_JSON_FILE = "./RELEASE_NOTES.json"
      # Checks whether a release notes/ changelog file exists in the project
      def self.check_if_file_exists(type)
        if type == "md"
          UI.message("Checking if #{RELEASE_NOTES_MD_FILE} exists!")
          FileUtils.touch(RELEASE_NOTES_MD_FILE)
        else
          UI.message("Checking if #{RELEASE_NOTES_JSON_FILE} exists!")
          FileUtils.touch(RELEASE_NOTES_JSON_FILE)
          # If file is empty add an an empty array
          if File.zero?(RELEASE_NOTES_JSON_FILE)
            File.write(RELEASE_NOTES_JSON_FILE, [])
          end
        end
      end

      def self.add_placeholder_content(type, version)
        UI.message("Adding placeholder content!")
        # Write content to file, depending on the type
        if type == "md"
          File.write(RELEASE_NOTES_MD_FILE, GenerateReleaseNotesHelper.markdown_placeholder_content(version))
        else
          placeholder_content = GenerateReleaseNotesHelper.json_placeholder_content(version)

          file_contents = JSON.parse(File.read(RELEASE_NOTES_JSON_FILE))
          file_contents << placeholder_content

          File.open(RELEASE_NOTES_JSON_FILE, "w") do |f|
            f.puts(JSON.pretty_generate(file_contents))
          end
        end
      end

      def self.markdown_placeholder_content(version)
        return "## [v#{version}]
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
        "
      end

      def self.json_placeholder_content(version)
        return { "version" => version,
          "description" => "A short introduction to the release, whether it's a minor, major or breaking release",
          "new_features" => ["List all new features here"],
          "bug_fixes" => ["List all bug fixes here"],
          "breaking_changes" => ["List all breaking changes here"],
          "deprecations" => ["List all deprecations here"],
          "migration_steps" => ["A detailed guide on how to migrate to this version from an earlier version"],
          "security_advisory" => ["Any security advisories"] }
      end
    end
  end
end
