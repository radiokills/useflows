require "spec_helper"

describe Admin::ShotsController do
  render_views

  let!(:shot){ create :shot }
  let!(:shot_without_image){ create :shot_without_image }

  context "GET #index" do

    it "should get list of shots" do
      get :index, format: "json"
      controller.shots.should_not be_empty
    end

    it "should have pagination" do
      get :index, page: 1, per_page: 1, format: "json"
      controller.shots.should have(1).record
    end

  end

  context "GET #show" do

    it "should get shot" do
      get :show, id: shot.id, format: "json"
      controller.shot.should eq shot
    end

  end

  context "PUT #update" do

    it "should update record" do
      put :update, id: shot.id, shot: { description: "test"}, format: "json"
      response.should be_successful
      Shot.find(shot.id).description.should match /test/i
    end

    it "should not update failed record" do
      put :update, id: shot.id, shot: { description: nil, url: nil}, format: "json"
      response.should_not be_successful
    end

  end

end
