class UsersController < ApplicationController
	#before_action :logged_in_user[:create, :show]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if User.first.nil?
			if @user.save
				@user.update_attributes(admin: true)
				flash[:success]="Admin Account Created"
			end
			redirect_to user_path(@user)
		else
			if @user.save
				flash[:success]="Account Created"
				redirect_to user_path(@user)
			else
				render 'new'
			end
		end
	end

	def show
		@user = User.find(params[:id])
		@folder = Folder.new
	end

	private
		def first_user?
			if User.first.nil?
				false
			else
				true
			end
		end

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
