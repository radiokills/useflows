require "spec_helper"

describe ShotsUploader do
  include CarrierWave::Test::Matchers

  let!(:shot){ create :shot }

  before do
    ShotsUploader.enable_processing = true
    @uploader = ShotsUploader.new(shot, :image)
    @uploader.store!(File.open(Rails.root.join("spec","raw","test_block.gif").to_s))
  end

  after do
    ShotsUploader.enable_processing = false
    @uploader.remove!
  end

  context 'resizes' do
    it "100 x 100" do
      @uploader.thumb.should have_dimensions(100, 100)
    end

    it "800 x 600" do
      @uploader.huge.should have_dimensions(800, 600)
    end
  end

end
