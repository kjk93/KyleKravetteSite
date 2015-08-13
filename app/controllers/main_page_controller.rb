class MainPageController < ApplicationController
  def home
  	@user = User.first
  	@slideslots = @user.slideslots
  end

  def temp
  end
end
