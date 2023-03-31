require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?(:UI)

  module Helper
    class GenerateReleaseNotesHelper
      RELEASE_NOTES_FILE = "./RELEASE_NOTES.md"
      # class methods that you define here become available in your action
      # as `Helper::GenerateReleaseNotesHelper.your_method`

      # Checks whether a release notes/ changelog file exists in the project
      def self.check_if_file_exists
        UI.message("Checking if #{RELEASE_NOTES_FILE} exists!")
        FileUtils.touch(RELEASE_NOTES_FILE)
      end

      def self.add_placeholder_content
        UI.message("Adding placeholder content!")
        # Write content to file
        File.write(RELEASE_NOTES_FILE, GenerateReleaseNotesHelper.placeholder_content)
      end

      def self.placeholder_content
        return "## [vX.Y.Z]
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
    end
  end
end
