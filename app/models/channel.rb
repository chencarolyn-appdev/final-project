# == Schema Information
#
# Table name: channels
#
#  id             :integer          not null, primary key
#  name           :string
#  channel_number :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Channel < ApplicationRecord
    has_many :shows, :dependent => :nullify

#def shows
    #show_list = Channel.pluck(:id)
    #return Show.where({ :channel_id => show_list })
    #end

def shows
    return Channel.pluck(:id)
end

end
