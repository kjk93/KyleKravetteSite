class PicturesController < ApplicationController
	def create
		uploaded_pics = params[:picture][:pictures]
		count = 1
		message = ""
		@folder = Folder.find(params[:folder])
		count += @folder.pictures.count
		name = @folder.title
		uploaded_pics.each do |pic|
			@picture = @folder.pictures.build(picture: pic)
			@picture.update_attributes(order: count, title: "#{name}_#{count}", user_id: @folder.user_id)
			if @picture.save
				#create thumbnail
				@thumbnail = @picture.build_thumbnail(pic: pic)
				@thumbnail.update_attributes(title: "#{@picture.title}_thumb")
				if @thumbnail.save
					#create snapshot
					@snapshot = @picture.build_snapshot(image: pic)
					@snapshot.update_attributes(title: "#{@picture.title}_snap")
					if !@snapshot.save
						message = "snapshot failed"
					end
					message += "saved picture #{count}, "
					count += 1
				else
					message += "thumbnail #{count} failed"
				end
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

	def update
		@picture = Picture.find(params[:id])
		if @picture.update_attributes(picture_params)
			flash[:success]="#{@picture.title} was updated!"
			redirect_to folder_path(@picture.folder_id)
		else
			flash[:warning]="#{@picture.title} failed to update"
			redirect_to edit_picture_path(@picture)
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@thumbnail = @picture.thumbnail
		@snapshot = @picture.snapshot
		folder = Folder.find_by(id: @picture.folder_id)
		@snapshot.delete
		@thumbnail.delete
		@picture.delete
		flash[:success]="Picture deleted"
		redirect_to folder
	end

	private

		def picture_params
			params.require(:picture).permit(:picture, :order, :description)
		end
end
