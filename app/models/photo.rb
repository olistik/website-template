# == Schema Information
#
# Table name: photos
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  url                :string(255)
#  rating             :integer(10)
#  viewed             :integer(4)
#  customer_id        :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#

class Photo < ActiveRecord::Base
    extend CommonSelect
    belongs_to :customer
    has_many :pubblications, :dependent => :destroy
    has_many :advertisements, :through => :pubblications
    has_attached_file :image,
        :styles => {:medium => "300x300>", :thumb => "100x100>"},
        :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
        :url => "/system/:attachment/:id/:style/:basename.:extension"
    validates_attachment_presence :image
    validates_attachment_size :image, :less_than => 5.megabytes
#    validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
