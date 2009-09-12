# == Schema Information
# Schema version: 20090619154911
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  login             :string(255)
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class User < ActiveRecord::Base
    acts_as_authentic do |config|
        config.maintain_sessions = false
    end
    has_and_belongs_to_many :roles
end
