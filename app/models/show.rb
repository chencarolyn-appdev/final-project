# == Schema Information
#
# Table name: shows
#
#  id                   :integer          not null, primary key
#  title                :string
#  description          :text
#  time                 :datetime
#  channel_id           :integer
#  viewing_locations_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Show < ApplicationRecord
has_many :favorite_shows, :dependent => :destroy
belongs_to :channel
belongs_to :viewing_locations, :class_name => "ViewingLocation"
    def channel
    channel_id = Show.pluck(:channel_id)
   return Channel.where({ :id => channel_id }).at(0).name
end

def shows
    return Channel.pluck(:id)
end

  def date
    require "date"
    return Date.parse(Show.time)
  end
  
 def vl 
    fav_show = FavoriteShow.where({ :show_id => :id}).pluck(:show_id)
    show_info = Show.where({ :id => fav_show }).pluck(:viewing_locations_id)
    return ViewingLocation.where({ :id => show_info }).pluck(:location_name).first
end

 def channel_info
    show_channel = self.channel_id
    show_info = Show.where({ :id => fav_show }).pluck(:viewing_locations_id)
    return ViewingLocation.where({ :id => show_info }).pluck(:location_name).first
end
end

#belongs_to :channel, :class_name => "channel", :foreign_key => "channel_id"
#belongs_to :viewing_locations, :class_name => "ViewingLocation", :foreign_key => "viewing_locations_id"