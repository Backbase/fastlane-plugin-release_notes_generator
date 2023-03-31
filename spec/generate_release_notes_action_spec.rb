describe Fastlane::Actions::GenerateReleaseNotesAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The release_notes_generator plugin is working!")

      Fastlane::Actions::GenerateReleaseNotesAction.run(nil)
    end
  end
end
