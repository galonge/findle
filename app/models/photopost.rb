# == Schema Information
#
# Table name: photoposts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#

class Photopost < ActiveRecord::Base
	attr_accessible :photo
	validates :user_id, presence: true

	#defining relationships
	belongs_to :user

	#for paperclip
	has_attached_file :photo

	default_scope order: 'photoposts.created_at DESC'
end
