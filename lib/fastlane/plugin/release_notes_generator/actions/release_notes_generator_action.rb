require 'fastlane/action'
require_relative '../helper/release_notes_generator_helper'

module Fastlane
  module Actions
    class ReleaseNotesGeneratorAction < Action
      def self.run(params)
        UI.message("The release_notes_generator plugin is working!")
      end

      def self.description
        "A fastlane plugin that creates release notes following a particular format specified by the team"
      end

      def self.authors
        ["George Nyakundi"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "In order to follow a consistent format in creating release notes, this plugin lifts the responsibility of having to remember the sections that need to to be included when a release is being prepared"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "RELEASE_NOTES_GENERATOR_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        [:ios, :android].include?(platform)
        true
      end
    end
  end
end
