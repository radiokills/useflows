require 'spec_helper'

describe Shot do

  context "structure" do
    it { should respond_to :image, :url, :visible, :description }

    it { should_not be_visible }
    it { should be_hidden}

    it { should respond_to :visible? }
    it { should respond_to :hidden? }
  end

  context "tagging" do
    it { should respond_to :tag_list, :tags }
    it { should have_many(:tags) }
  end

  context "validation" do
    it { should validate_presence_of(:tag_list) }
    it { should validate_presence_of(:url) }
    it { Shot.new(image:"x").should be_valid }
  end

end
