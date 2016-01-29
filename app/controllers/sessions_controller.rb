class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    # byebug
    session[:user_id] = user.id
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end



# class SessionsController < ApplicationController
#   def create
#    #byebug
#     user = User.from_omniauth(env["omniauth.auth"])
#     session[:user_id] = user.id
#     redirect_to root_url
#   end

#   def destroy
#     session[:user_id] = nil
#     redirect_to root_url
#   end
# end
