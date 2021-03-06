class SessionsController < ApplicationController

	def new		
	end
	# sign in
	def create
		auth = request.env['omniauth.auth']
		# look in db for user, if not there then create
		user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_omniauth(auth)
		# once we have user, set the session [:user_id]
		session[:user_id] = user.id

		redirect_to root_url, notice: "Welcome, #{user.name}!"
	end
	# sign out
	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "You are signed out."
	end
end