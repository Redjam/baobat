class Status < ActiveRecord::Base
	validates :content, presence: true

	belongs_to :project
end
