class ChannelsController < ApplicationController
  def list
    @channels = Channel.all

    render("channel_templates/list.html.erb")
  end

  def details
    @channel = Channel.where({ :id => params.fetch("id_to_display") }).first

    render("channel_templates/details.html.erb")
  end

  def blank_form
    @channel = Channel.new

    render("channel_templates/blank_form.html.erb")
  end

  def save_new_info
    @channel = Channel.new

    @channel.name = params.fetch("name")
    @channel.channel_number = params.fetch("channel_number")

    if @channel.valid?
      @channel.save

      redirect_to("/channels", { :notice => "Channel created successfully." })
    else
      render("channel_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @channel = Channel.where({ :id => params.fetch("id_to_prefill") }).first

    render("channel_templates/prefilled_form.html.erb")
  end

  def save_edits
    @channel = Channel.where({ :id => params.fetch("id_to_modify") }).first

    @channel.name = params.fetch("name")
    @channel.channel_number = params.fetch("channel_number")

    if @channel.valid?
      @channel.save

      redirect_to("/channels/" + @channel.id.to_s, { :notice => "Channel updated successfully." })
    else
      render("channel_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @channel = Channel.where({ :id => params.fetch("id_to_remove") }).first

    @channel.destroy

    redirect_to("/channels", { :notice => "Channel deleted successfully." })
  end
end
