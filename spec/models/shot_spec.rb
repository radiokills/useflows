require 'spec_helper'

describe Shot do

  context "structure" do
    it { should respond_to :image, :url, :visible, :description }
    it { should_not be_visible }
    it { should be_hidden}
    it { should respond_to :visible? }
    it { should respond_to :hidden? }
    it { should respond_to :email, :tw_handler }
  end

  context "tagging" do
    it { should respond_to :tag_list, :tags }
    it { should have_many(:tags) }
  end

  context "without image you need description" do
    subject { build(:shot_without_image) }
    it { should be_valid }
    it { should validate_presence_of :url }
    it { should validate_presence_of :description }
  end

  context "with image" do

    context "presence" do
      subject { Shot.new url: "http://dlabs.si", image: nil }
      it { should be_invalid }
      it { should_not validate_presence_of :image }
    end

    context "right dimensions" do
      subject { build :shot }
      it { should be_valid }
    end

    context "wrong dimensions" do
      subject { build(:shot, image: File.open(Rails.root.join("spec","raw","test_to_small.gif").to_s)) }
      it { should be_invalid }
      it { expect(subject.error_on(:image)).to include "dimensions don't match #{Shot::IMAGE_MUST_WIDTH}x#{Shot::IMAGE_MUST_HEIGHT}" }
    end

  end

  context "#small_url" do
    it { build(:shot).small_url.should eq "dlabs.si"}
    it { build(:shot,url:"https://demo.si").small_url.should eq "demo.si"}
    it { build(:shot,url:"demo.si").small_url.should eq "demo.si"}
  end

  context "#tw_handler" do
    it { build(:shot,tw_handler: "@otobrglez").should have(1).error_on :tw_handler }
    it { build(:shot,tw_handler: "otobrglez").should have(0).error_on :tw_handler }
  end

end
