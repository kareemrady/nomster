class Photo < ActiveRecord::Base
	belongs_to :place
	mount_uploader :picture, PictureUploader
	validates :caption, :presence => true
	validates :picture , :presence => true
end
