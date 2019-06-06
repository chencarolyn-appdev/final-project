class UsersController < ApplicationController
    
def new_form
    render ("user_templates/new_form.html.erb")
end
def save_new_row
    u= User.new
    u.email = params.fetch("email")
    u.username = params.fetch("username")
    u.password = params.fetch("password")
    u.save
    redirect_to("/shows")
    
    #cookies[:email] = params.fetch("email")
    #cookies[:username] = params.fetch("username")
    #cookies[:password] = params.fetch("password")
end
    
end
