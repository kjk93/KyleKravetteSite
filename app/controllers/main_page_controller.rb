class MainPageController < ApplicationController
  def home
  	@user = User.first
  end

  def temp
  end
end
