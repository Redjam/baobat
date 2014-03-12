class Status < ActiveRecord::Base
	
	validates :content, presence: true

	belongs_to :project

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }
	validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png)

end
