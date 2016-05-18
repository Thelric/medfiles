class Patient < ActiveRecord::Base
	has_many :records, dependent: :destroy
	has_many :appointments, dependent: :destroy
	has_many :us_pat_rels, dependent: :destroy
	has_many :users, :through => :us_pat_rels
	has_many :physicians, :through => :appointments

	validates :appat, presence: true
	validates :name, presence: true
	validates :sex, presence: true

	before_save :strip_whitespace

	def full_name
		"#{appat} #{apmat}, #{name}"
	end

	private
		def strip_whitespace
			self.appat = appat.strip
			self.apmat = apmat.strip if attribute_present?("apmat")
			self.name = name.strip
			self.sex = sex.strip
			self.eciv = eciv.strip if attribute_present?("eciv")
			self.calle = calle.strip if attribute_present?("calle")
			self.tcasa = tcasa.gsub(/[^0-9]/,"") if attribute_present?("tcasa")
			self.tof = tof.gsub(/[^0-9]/,"") if attribute_present?("tof")
			self.cel = cel.gsub(/[^0-9]/,"") if attribute_present?("cel")
			self.email = email.strip if attribute_present?("email")
		end
end
