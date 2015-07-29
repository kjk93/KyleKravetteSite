class SlideslotsController < ApplicationController
  def edit
  	@slideslot = Slideslot.find(params[:id])
  	@user = @slideslot.user
  	@pictures = @slideslot.user.pictures
  end

  def update
  	@slideslot = Slideslot.find(params[:id])
  	if @slideslot.update_attributes(picture: params[:picture_url], picture_id: params[:picture_id])
  		redirect_to edit_slideslot_path(@slideslot)
  	else
  		flash[:danger]="reassign failed"
  	end
  end

  private

  	def slideslot_params
  		params.require(:slideslot).permit(:picture)
  	end
end
