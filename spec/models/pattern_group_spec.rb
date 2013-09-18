require 'spec_helper'

describe PatternGroup do

  context "structure" do
    it { should respond_to :name }
    it { should have(1).error_on :name }
    it { PatternGroup.new(name:"Test").to_s.should match /test/i }
  end



end
