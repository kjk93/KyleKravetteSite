module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user?(user)
		user == current_user
	end

	def current_user
		if(user = session[:user_id])
			@current_user ||= User.find_by(id: user)
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def logout
		session.delete(:user_id)
		@current_user = nil
	end

	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	def store_location
		session[:forwarding_url] = request.url if request.get?
	end
end