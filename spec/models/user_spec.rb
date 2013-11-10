require 'spec_helper'

describe User do
  context 'favorites' do
    let!(:shot) { create :shot }

    context 'structure' do
      subject { create :user }
      it { should respond_to :favorites }
      it { should respond_to :shots }
    end

    context 'can add favorite' do
      let!(:user) { create :user }
      let!(:shots) { user.shots.push shot }
      subject { user.reload }
      it  { should have(1).shots }
    end

  end
end
