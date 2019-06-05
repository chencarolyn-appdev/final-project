Rails.application.routes.draw do
  # Routes for the Favorite show resource:

  # CREATE
  match("/new_favorite_show_form", { :controller => "favorite_shows", :action => "blank_form", :via => "get" })
  match("/insert_favorite_show_record", { :controller => "favorite_shows", :action => "save_new_info", :via => "post" })

  # READ
  match("/favorite_shows", { :controller => "favorite_shows", :action => "list", :via => "get" })
  match("/favorite_shows/:id_to_display", { :controller => "favorite_shows", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_favorite_show_form/:id_to_prefill", { :controller => "favorite_shows", :action => "prefilled_form", :via => "get" })
  match("/update_favorite_show_record/:id_to_modify", { :controller => "favorite_shows", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_favorite_show/:id_to_remove", { :controller => "favorite_shows", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  # Routes for the Viewing location resource:
  match("/shows", { :controller =>"shows", :action => "names", :via => "get" })
  
  match("/users/sign-up", { :controller =>"users", :action => "new_form", :via => "get" })

  match("/create_user_record", { :controller =>"users", :action => "save_new_row", :via => "get" })

  match("/users/sign-in", { :controller =>"session", :action => "new_form", :via => "get" })

  match("/prove_you_are_you", { :controller =>"session", :action => "prove", :via => "post" })
  
  # CREATE
  match("/new_viewing_location_form", { :controller => "viewing_locations", :action => "blank_form", :via => "get" })
  match("/insert_viewing_location_record", { :controller => "viewing_locations", :action => "save_new_info", :via => "post" })

  # READ
  match("/viewing_locations", { :controller => "viewing_locations", :action => "list", :via => "get" })
  match("/viewing_locations/:id_to_display", { :controller => "viewing_locations", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_viewing_location_form/:id_to_prefill", { :controller => "viewing_locations", :action => "prefilled_form", :via => "get" })
  match("/update_viewing_location_record/:id_to_modify", { :controller => "viewing_locations", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_viewing_location/:id_to_remove", { :controller => "viewing_locations", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Channel resource:

  # CREATE
  match("/new_channel_form", { :controller => "channels", :action => "blank_form", :via => "get" })
  match("/insert_channel_record", { :controller => "channels", :action => "save_new_info", :via => "post" })

  # READ
  match("/channels", { :controller => "channels", :action => "list", :via => "get" })
  match("/channels/:id_to_display", { :controller => "channels", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_channel_form/:id_to_prefill", { :controller => "channels", :action => "prefilled_form", :via => "get" })
  match("/update_channel_record/:id_to_modify", { :controller => "channels", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_channel/:id_to_remove", { :controller => "channels", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Show resource:

  # CREATE
  match("/new_show_form", { :controller => "shows", :action => "blank_form", :via => "get" })
  match("/insert_show_record", { :controller => "shows", :action => "save_new_info", :via => "post" })

  # READ
  match("/shows", { :controller => "shows", :action => "list", :via => "get" })
  match("/shows/:id_to_display", { :controller => "shows", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_show_form/:id_to_prefill", { :controller => "shows", :action => "prefilled_form", :via => "get" })
  match("/update_show_record/:id_to_modify", { :controller => "shows", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_show/:id_to_remove", { :controller => "shows", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
