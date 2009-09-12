# == Schema Information
# Schema version: 20090619154911
#
# Table name: advertisement_notes
#
#  id               :integer(4)      not null, primary key
#  content          :text
#  advertisement_id :integer(4)
#  created_at       :datetime
#  updated_at       :datetime
#

class AdvertisementNote < ActiveRecord::Base
    extend CommonSelect
    belongs_to :advertisement

    def self.all_for_select(options = {})
        super(:field => :content)
    end
end
