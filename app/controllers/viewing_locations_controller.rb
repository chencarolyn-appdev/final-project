class ViewingLocationsController < ApplicationController
  def list
    @viewing_locations = ViewingLocation.all

    render("viewing_location_templates/list.html.erb")
  end

  def details
    @viewing_location = ViewingLocation.where({ :id => params.fetch("id_to_display") }).first

    render("viewing_location_templates/details.html.erb")
  end

  def blank_form
    @viewing_location = ViewingLocation.new

    render("viewing_location_templates/blank_form.html.erb")
  end

  def save_new_info
    @viewing_location = ViewingLocation.new

    @viewing_location.location_name = params.fetch("location_name")
    @viewing_location.location_address = params.fetch("location_address")

    if @viewing_location.valid?
      @viewing_location.save

      redirect_to("/viewing_locations", { :notice => "Viewing location created successfully." })
    else
      render("viewing_location_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @viewing_location = ViewingLocation.where({ :id => params.fetch("id_to_prefill") }).first

    render("viewing_location_templates/prefilled_form.html.erb")
  end

  def save_edits
    @viewing_location = ViewingLocation.where({ :id => params.fetch("id_to_modify") }).first

    @viewing_location.location_name = params.fetch("location_name")
    @viewing_location.location_address = params.fetch("location_address")

    if @viewing_location.valid?
      @viewing_location.save

      redirect_to("/viewing_locations/" + @viewing_location.id.to_s, { :notice => "Viewing location updated successfully." })
    else
      render("viewing_location_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @viewing_location = ViewingLocation.where({ :id => params.fetch("id_to_remove") }).first

    @viewing_location.destroy

    redirect_to("/viewing_locations", { :notice => "Viewing location deleted successfully." })
  end
end
