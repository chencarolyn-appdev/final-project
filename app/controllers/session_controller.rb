class SessionController < ApplicationController
    def new_form
        render("session_templates/new_form.html.erb")
    end

    def prove
    
    email = params.fetch("email")
    pw = params.fetch("password")
    
    u = User.where({ :encrypted_password => pw, :email =>email }).first
    
    if u == nil
        redirect_to("/users/sign-in", {:notice => "Incorrect login info. Please try again"})
    else
    session[:user_id] = u.id
        redirect_to("/shows")
    end
end
end 
