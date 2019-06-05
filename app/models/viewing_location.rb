# == Schema Information
#
# Table name: viewing_locations
#
#  id               :integer          not null, primary key
#  location_name    :string
#  location_address :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class ViewingLocation < ApplicationRecord
has_many :shows, :foreign_key => "viewing_locations_id", :dependent => :nullify

end
