# == Schema Information
# Schema version: 20090619154911
#
# Table name: contact_types
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ContactType < ActiveRecord::Base
    extend CommonSelect
    has_many :contact_details
end
