class PicturesController < ApplicationController
	def create
		count = 1
		message = ""
		@folder = Folder.find(params[:folder])
		count += @folder.pictures.count
		name = @folder.title
		params[:picture][:pictures].each do |pic|
			@picture = @folder.pictures.build(picture: pic)
			@picture.update_attributes(order: count)
			@picture.update_attributes(title: "#{name}_#{count}")
			if @picture.save
				message += "saved picture #{count}, "
				count += 1
			else
				message += "picture #{count} failed"
			end
		end
		flash[:success] = message
		redirect_to @folder
	end

	def edit
		@picture = Picture.find(params[:id])
	end

	private

		def picture_params
			params.require(:picture).permit(:picture, :order, :description)
		end
end
