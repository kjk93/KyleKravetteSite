class UsersController < ApplicationController
	before_action :logged_in_user, only: :show
	before_action :admin_unless

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if User.first.nil?
			if @user.save
				@user.update_attributes(admin: true)
				@slideshow = @user.build_slideshow
				if @slideshow.save
					message = "slideshow saved"
					for i in 1..5
						@slideslot = @slideshow.slideslots.build(number: i)
						if @slideslot.save
							message += ", slot_#{@slideslot.number} saved"
						else
							message += ", slot_#{@slideslot.number} failed"
						end
					end
				else
					message = "slideshow failed"
				end
				flash[:success]=message

				#flash[:success]="Admin Account Created"
				log_in(@user)
			end
			redirect_to user_path(@user)
		else
			if @user.save
				@slideshow = @user.build_slideshow
				if @slideshow.save
					message = "slideshow saved"
					for i in 1..5
						@slideslot = @slideshow.slideslots.build(number: i)
						if @slideslot.save
							message += ", slot_#{@slideslot.number} saved"
						else
							message += ", slot_#{@slideslot.number} failed"
						end
					end
				else
					message = "slideshow failed"
				end
				flash[:success]=message

				#flash[:success]="Account Created"
				redirect_to user_path(@user)
			else
				render 'new'
			end
		end
	end

	def show
		@user = User.find(params[:id])
		@folder = Folder.new
		@folders = @user.folders
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

		def admin_unless
			if !logged_in?
				redirect_to root_url unless User.first.nil?
			else
				redirect_to root_url unless current_user.admin?
			end
		end
end
