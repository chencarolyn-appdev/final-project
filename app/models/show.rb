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
has_many :shows, :dependent => :nullify
    def channel
    channel_id = Show.pluck(:channel_id)
   return Channel.where({ :id => channel_id }).at(0).name
end

end

#belongs_to :channel, :class_name => "channel", :foreign_key => "channel_id"
#belongs_to :viewing_locations, :class_name => "ViewingLocation", :foreign_key => "viewing_locations_id"