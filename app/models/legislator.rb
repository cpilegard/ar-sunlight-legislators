require_relative '../../db/congfig'

class Legislator < ActiveRecord::Base
	validates :title, :firstname, :lastname, :party, :state


	def name
		"#{self.firstname} #{self.middlename} #{self.lastname} #{self.name_suffix}"
	end

end