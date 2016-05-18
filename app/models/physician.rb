class Physician < ActiveRecord::Base
	has_many :appointments, dependent: :destroy
	has_many :us_phys_rels, dependent: :destroy
	has_many :users, :through => :us_phys_rels
	has_many :patients, :through => :appointments

	validates :name, presence: true

	before_save :strip_whitespace

	private
		def strip_whitespace
			self.name = name.strip
		end
end
