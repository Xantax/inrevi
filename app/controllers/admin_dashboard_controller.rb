class AdminDashboardController < ApplicationController
  def index
    @activities = PublicActivity::Activity.order("created_at desc").all
  end
end
