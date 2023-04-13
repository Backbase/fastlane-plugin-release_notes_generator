describe Fastlane::Actions::GenerateReleaseNotesAction do
  describe '#check_if_file_exists_markdown' do
    it 'print a message' do
      expect(Fastlane::UI).to receive(:message).with("Checking if ./RELEASE_NOTES.md exists!")
      Fastlane::Helper::GenerateReleaseNotesHelper.check_if_file_exists("md")
    end
  end

  describe '#check_if_file_exists_json' do
    it 'print a message' do
      expect(Fastlane::UI).to receive(:message).with("Checking if ./RELEASE_NOTES.json exists!")
      Fastlane::Helper::GenerateReleaseNotesHelper.check_if_file_exists("json")
    end
  end

  describe '#add_placeholder_content' do
    it 'print a message' do
      expect(Fastlane::UI).to receive(:message).with("Adding placeholder content!")

      Fastlane::Helper::GenerateReleaseNotesHelper.add_placeholder_content("md", "x.y.z")
    end
  end
end
