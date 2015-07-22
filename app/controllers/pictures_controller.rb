class PicturesController < ApplicationController
	def create
		count = 1
		message = ""
		@folder = Folder.find(params[:folder])
		byebug
		params[:picture][:pictures].each do |pic|
			byebug
			@picture = @folder.pictures.build(picture: pic)
			byebug
			@picture.update_attributes(order: count)
			byebug
			if @picture.save
				count += 1
				message += "saved picture #{count}, "
			else
				message += "picture #{count} failed"
			end
		end
		flash[:success] = message
		redirect_to @folder
	end

	private

		def picture_params
			params.require(:picture).permit(:picture, :order, :description)
		end
end
