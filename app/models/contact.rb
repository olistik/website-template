# == Schema Information
#
# Table name: contacts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
    extend CommonSelect
    has_many :advertisements
    has_many :details, :class_name => "ContactDetail"
end
