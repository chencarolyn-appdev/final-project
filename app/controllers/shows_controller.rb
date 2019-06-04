class ShowsController < ApplicationController
  
  def names
     @shows = Show.order({ :time => :desc})
     render("show_templates/list.html.erb")
  end
  

  def list
    @shows = Show.all

    render("show_templates/list.html.erb")
  end

  def details
    @show = Show.where({ :id => params.fetch("id_to_display") }).first

    render("show_templates/details.html.erb")
  end

  def blank_form
    @show = Show.new

    render("show_templates/blank_form.html.erb")
  end

  def save_new_info
    @show = Show.new

    @show.title = params.fetch("title")
    @show.description = params.fetch("description")
    @show.time = params.fetch("time")
    @show.channel_id = params.fetch("channel_id")
    @show.viewing_locations_id = params.fetch("viewing_locations_id")

    if @show.valid?
      @show.save

      redirect_to("/shows", { :notice => "Show created successfully." })
    else
      render("show_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @show = Show.where({ :id => params.fetch("id_to_prefill") }).first

    render("show_templates/prefilled_form.html.erb")
  end

  def save_edits
    @show = Show.where({ :id => params.fetch("id_to_modify") }).first

    @show.title = params.fetch("title")
    @show.description = params.fetch("description")
    @show.time = params.fetch("time")
    @show.channel_id = params.fetch("channel_id")
    @show.viewing_locations_id = params.fetch("viewing_locations_id")

    if @show.valid?
      @show.save

      redirect_to("/shows/" + @show.id.to_s, { :notice => "Show updated successfully." })
    else
      render("show_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @show = Show.where({ :id => params.fetch("id_to_remove") }).first

    @show.destroy

    redirect_to("/shows", { :notice => "Show deleted successfully." })
  end
  
    def channel
    channel_id = Show.pluck(:channel_id)
   return Channel.where({ :id => channel_id }).pluck(:name).first
end

end
