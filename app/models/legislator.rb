require_relative '../../db/config'

class Legislator < ActiveRecord::Base
	validates :title, :firstname, :lastname, :party, :state, :in_office, presence: true

	def name
		name = self.firstname
		name += " #{self.middlename}" if self.middlename != ''
		name += " #{self.lastname}" if self.lastname != ''
		name += " #{self.name_suffix}" if self.name_suffix != ''
		name
	end
end