# == Schema Information
#
# Table name: pubblications
#
#  id               :integer(4)      not null, primary key
#  photo_id         :integer(4)
#  advertisement_id :integer(4)
#  promote          :boolean(1)
#

class Pubblication < ActiveRecord::Base
    belongs_to :photo
    belongs_to :advertisement
end
