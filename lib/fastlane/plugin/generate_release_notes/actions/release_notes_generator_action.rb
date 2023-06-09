require 'fastlane/action'
require_relative '../helper/release_notes_generator_helper'

module Fastlane
  ConfigItem = FastlaneCore::ConfigItem unless Fastlane.const_defined?(:ConfigItem)
  module Actions
    class GenerateReleaseNotesAction < Action
      def self.run(params)
        # Extract params
        format = params[:format] || "json"
        version = params[:version] || "x.y.z"

        Helper::GenerateReleaseNotesHelper.check_if_file_exists(format)
        Helper::GenerateReleaseNotesHelper.add_placeholder_content(format, version)
      end

      def self.description
        "A fastlane plugin that creates release notes following a particular format specified by the team"
      end

      def self.authors
        ["Backbase B.V"]
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
          ConfigItem.new(key: :format,
            env_name: "RNG_FORMAT",
            description: "md for markdown or json for JSON",
            optional: true,
            type: String,
            default_value: "json"),
          ConfigItem.new(key: :version,
            env_name: "RNG_VERSION",
            description: "Version being released",
            optional: true,
            type: String,
            default_value: "X.Y.Z")
        ]
      end

      def self.is_supported?(platform)
        [:ios, :android].include?(platform)
        true
      end
    end
  end
end
