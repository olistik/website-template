# == Schema Information
#
# Table name: contact_details
#
#  id              :integer(4)      not null, primary key
#  contact_id      :integer(4)
#  contact_type_id :integer(4)
#  content         :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class ContactDetail < ActiveRecord::Base
    belongs_to :contact
    belongs_to :contact_type
end
