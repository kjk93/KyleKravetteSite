class ThumbnailsController < ApplicationController
  def destroy
  	Thumbnail.find(params[:id]).delete
  end
end
