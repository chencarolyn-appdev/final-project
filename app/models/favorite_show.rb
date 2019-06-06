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

def show_name
    return Show.where({ :id => :show_id }).pluck(:title).first
end
end
