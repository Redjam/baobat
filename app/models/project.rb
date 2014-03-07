class Project < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true

	has_many :statuses
	belongs_to :client, class_name: "User", foreign_key: "client_id"
end
