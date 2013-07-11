require_relative '../../db/congfig'

class Legislator < ActiveRecord::Base
	validates :title, :name, :lastname, :party, :state, :in_office, presence: true
end