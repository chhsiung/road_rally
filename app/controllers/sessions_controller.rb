class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    unless @auh = Authorization.find_from_hash(auth)
      #create new user or add an auth to existing user
      @auth = Authorization.create_from_hash(auth, current_user)
    end

    #log in
    self.current_user = @auth.user

    render :text => "Welcome, #{current_user.name}."
  end
end
