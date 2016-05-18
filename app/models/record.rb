class Record < ActiveRecord::Base
	belongs_to :patient
	validates :body, presence: true
end
