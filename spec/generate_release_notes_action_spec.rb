describe Fastlane::Actions::GenerateReleaseNotesAction do
  describe '#check_if_file_exists' do
    it 'print a message' do
      expect(Fastlane::UI).to receive(:message).with("Checking if ./RELEASE_NOTES.md exists!")

      Fastlane::Helper::GenerateReleaseNotesHelper.check_if_file_exists
    end
  end

  describe '#add_placeholder_content' do
    it 'print a message' do
      expect(Fastlane::UI).to receive(:message).with("Adding placeholder content!")

      Fastlane::Helper::GenerateReleaseNotesHelper.add_placeholder_content
    end
  end
end
