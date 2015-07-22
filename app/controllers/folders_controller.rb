class FoldersController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@folder = current_user.folders.build(folder_params)
		if @folder.save
			flash[:success]="#{@folder.title} folder has been created"
			redirect_to @folder
		else
			flash[:danger]="Folder did not save"
		end
	end

	def show
		@folder = Folder.find(params[:id])
	end

	private

		def folder_params
			params.require(:folder).permit(:title)
		end
end
