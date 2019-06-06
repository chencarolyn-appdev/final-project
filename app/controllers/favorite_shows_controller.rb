class FavoriteShowsController < ApplicationController
 def show_name
    @shows = Show.all
    return Show.where({ :id => :show_id }).pluck(:title).first
end

def list
    @favorite_shows = FavoriteShow.all

    render("favorite_show_templates/list.html.erb")
  end

  def details
    @favorite_show = FavoriteShow.where({ :id => params.fetch("id_to_display") }).first

    render("favorite_show_templates/details.html.erb")
  end

  def blank_form
    
    @shows= Show.all
    @viewing_locations= ViewingLocation.all
    @users = User.all
    @favorite_show = FavoriteShow.new

    render("favorite_show_templates/blank_form.html.erb")
  end

  def save_new_info
    @favorite_show = FavoriteShow.new

    @favorite_show.show_id = params.fetch("show_id")
    @favorite_show.user_id = params.fetch("user_id")

    if @favorite_show.valid?
      @favorite_show.save

      redirect_to("/favorite_shows", { :notice => "Favorite show created successfully." })
    else
      render("favorite_show_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @favorite_show = FavoriteShow.where({ :id => params.fetch("id_to_prefill") }).first

    render("favorite_show_templates/prefilled_form.html.erb")
  end

  def save_edits
    @favorite_show = FavoriteShow.where({ :id => params.fetch("id_to_modify") }).first

    @favorite_show.show_id = params.fetch("show_id")
    @favorite_show.user_id = params.fetch("user_id")

    if @favorite_show.valid?
      @favorite_show.save

      redirect_to("/favorite_shows/" + @favorite_show.id.to_s, { :notice => "Favorite show updated successfully." })
    else
      render("favorite_show_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @favorite_show = FavoriteShow.where({ :id => params.fetch("id_to_remove") }).first

    @favorite_show.destroy

    redirect_to("/favorite_shows", { :notice => "Favorite show deleted successfully." })
  end
end
