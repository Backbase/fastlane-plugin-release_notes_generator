require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class GenerateReleaseNotesHelper
      # class methods that you define here become available in your action
      # as `Helper::GenerateReleaseNotesHelper.your_method`

      # Checks whether a release notes/ changelog file exists in the project
      def self.check_if_file_exists
        UI.message("Checking if file exists!")
      end

      # Create a release notes/ changelog file in the root of the project
      def self.create_file 
        UI.message("Creating release notes/changelog!")
      end

      def self.add_placeholder_content
        UI.message("Adding placeholder content!")
      end
    end
  end
end
