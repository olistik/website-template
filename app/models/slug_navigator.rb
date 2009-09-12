# == Schema Information
# Schema version: 20090619154911
#
# Table name: slug_navigators
#
#  id         :integer(4)      not null, primary key
#  slug_id    :integer(4)
#  parent_id  :integer(4)
#  alt        :string(255)
#  content    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class SlugNavigator < ActiveRecord::Base
    belongs_to :slug
    belongs_to :parent, :class_name => "SlugNavigator"
end
