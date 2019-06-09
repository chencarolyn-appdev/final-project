# == Schema Information
#
# Table name: favorite_shows
#
#  id         :integer          not null, primary key
#  show_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteShow < ApplicationRecord
belongs_to :show
belongs_to :user

  
def save_new_row
    u= User.new
    u.email = params.fetch("email")
    u.username = params.fetch("username")
    u.password = params.fetch("password")
    u.save
    redirect_to("/shows")
end
 def vl 
    fav_show = self.show_id
    show_info = Show.where({ :id => fav_show }).pluck(:viewing_locations_id)
    return ViewingLocation.where({ :id => show_info }).pluck(:location_name).first
end

def show_name
    fav_name = self.show_id
    return Show.where({ :id => fav_name }).pluck(:title).first
end
    


def show_channel
    fav_show = self.show_id
    show_info = Show.where({ :id => fav_show }).pluck(:channel_id)
    return Channel.where({ :id => show_info }).pluck(:name).first
end

def show_time
    fav_show = self.show_id
    return Show.where({ :id => fav_show }).pluck(:time).first
end

def show_description
    fav_show = self.show_id
    return Show.where({ :id => fav_show }).pluck(:description).first
end

def show_tracker
    show_title = FavoriteShow.pluck(:show_id)
    returned_show = Show.where ({ :id => show_title})
end

def show_info
    fav_show = self.pluck(:show_id)
    return Show.where({ :id => fav_show }).pluck(:viewing_locations_id)
end


end