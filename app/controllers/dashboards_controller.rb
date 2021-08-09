class DashboardsController < ApplicationController
  def show
    @shouts = current_user.shouts.order(created_at: :desc)
    @shout = Shout.new
  end
end
