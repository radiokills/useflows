require 'spec_helper'

describe Shot do

  context "structure" do
    it { should respond_to :image, :url, :visible, :description }
    it { should_not be_visible }
    it { should be_hidden}
    it { should respond_to :visible? }
    it { should respond_to :hidden? }
    it { should belong_to(:pattern_group) }
    it { should validate_presence_of :pattern_group_id }
    it { should respond_to :email, :tw_handler }
  end

=begin
  context "tagging" do
    it { should respond_to :tag_list, :tags }
    it { should have_many(:tags) }
  end
=end

  context "without image you need description" do
    subject { build(:shot_without_image) }
    it { should be_valid }

    it { Shot.new.should have(1).error_on :url }
    it { Shot.new.should have(1).error_on :description }
  end

  context "with image" do

    context "presence" do
      subject { Shot.new url: "http://dlabs.si", image: nil }
      it { should be_invalid }
      it { should have(0).error_on :image }
    end

    context "right dimensions" do
      subject { build :shot }
      it { should be_valid }
    end

    context "wrong dimensions" do
      subject { build(:shot, image: File.open(Rails.root.join("spec","raw","test_to_small.gif").to_s)) }
      it { should be_invalid }
      it { should have(1).error_on :image }
    end

  end

  context "#small_url" do
    it { build(:shot).small_url.should eq "dlabs.si"}
    it { build(:shot,url:"https://demo.si").small_url.should eq "demo.si"}
    it { build(:shot,url:"demo.si").small_url.should eq "demo.si"}
  end

end
