class MainPageController < ApplicationController
  def home
  	@user = User.first
  	@slideslots = @user.slideslots
  end

  def temp
  end

  def photos
  	@user = User.first
  	@folders = @user.folders
  end
end
