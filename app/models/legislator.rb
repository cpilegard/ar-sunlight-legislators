require_relative '../../db/config'

class Legislator < ActiveRecord::Base
	validates :title, :name, :party, :state, :in_office, presence: true
end