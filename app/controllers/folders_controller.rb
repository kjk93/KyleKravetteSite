class FoldersController < ApplicationController
	before_action :logged_in_user

	def create
		@folder = current_user.folders.build(folder_params)
		if @folder.save
			flash[:success]="#{@folder.title} folder has been created"
			redirect_to edit_folder_path(@folder)
		else
			flash[:danger]="Folder did not save"
		end
	end

	def show
		@folder = Folder.find(params[:id])
		@pictures = @folder.pictures
	end

	def edit
		@folder = Folder.find(params[:id])
	end

	def update
		@folder = Folder.find(params[:id])
		if @folder.update_attributes(folder_params)
			flash[:success]="#{@folder.title} was updated!"
			redirect_to user_path(@folder.user_id)
		else
			flash[:warning]="#{@folder.title} failed to update"
			redirect_to edit_folder_path(@folder)
		end
	end

	def destroy
		@folder = Folder.find(params[:id])
		user = User.find_by(id: @folder.user_id)
		@folder.delete
		flash[:success]="#{@folder.title} deleted"
		redirect_to user
	end

	def view
		@folder = Folder.find(params[:id])
		@pictures = @folder.pictures
	end

	private

		def folder_params
			params.require(:folder).permit(:title)
		end
end
