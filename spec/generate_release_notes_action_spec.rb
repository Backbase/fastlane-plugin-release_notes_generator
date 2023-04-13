describe Fastlane::Actions::GenerateReleaseNotesAction do
  test_md_file = "./RELEASE_NOTES.md"
  test_json_file = "./RELEASE_NOTES.json"

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

  describe '#add_placeholder_content_markdown' do
    it 'print a message' do
      expect(Fastlane::UI).to receive(:message).with("Adding placeholder content!")

      Fastlane::Helper::GenerateReleaseNotesHelper.add_placeholder_content("md", "0.1.0")
    end
  end

  describe '#add_placeholder_content_json' do
    it 'print a message' do
      expect(Fastlane::UI).to receive(:message).with("Adding placeholder content!")

      Fastlane::Helper::GenerateReleaseNotesHelper.add_placeholder_content("json", "0.1.0")
    end
  end

  describe "#check_if_file_exists" do
    it 'creates a markdown file if missing' do
      # Prepare
      FileUtils.rm(test_md_file)
      # Act
      Fastlane::Helper::GenerateReleaseNotesHelper.check_if_file_exists("md")
      # Assert that file has been created.
      expect(File.exist?(test_md_file)).to eq(true)
    end
  end

  describe "#check_if_file_exists" do
    it 'creates a json file if missing' do
      # Prepare
      FileUtils.rm(test_json_file)
      # Act
      Fastlane::Helper::GenerateReleaseNotesHelper.check_if_file_exists("json")
      # Assert that file has been created.
      expect(File.exist?(test_json_file)).to eq(true)
    end
  end
end
