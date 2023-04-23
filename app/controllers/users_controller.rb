class UsersController < ApplicationController

  def all_users
    matching_users = User.all
    @users = matching_users.order(:created_at)

    render({ :template => "user_templates/all_users.html.erb"})
  end
  
  def show
    username = params.fetch("username")
    matching_users = User.where({ :username => username })
    @user = matching_users.at(0)

    render({ :template => "user_templates/user_details.html.erb"})
  end
  
  def create
    user = User.new
    user.username = params.fetch("query_username")
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
     user_url = params.fetch("user_url")
     user = User.where({ :username => user_url }).at(0)
     #the_user.username = params.fetch("query_username")
     #the_user = matching_users.at(0)
     user.username = params.fetch("query_username")
     #the_user.username = params.fetch("query_username")
     #the_user.save
     user.save

     redirect_to("/users/#{user.username}")
  end

end
