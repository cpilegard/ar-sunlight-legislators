require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string  :title
      t.string  :firstname
      t.string  :middlename
      t.string  :lastname
      t.string  :name_suffix
      t.string  :party
      t.string  :state
      t.integer :in_office 
      t.string  :gender
      t.string  :phone
      t.string  :fax
      t.string  :website
      t.string  :webform
      t.string  :twitter_id
      t.date    :birthdate
    end
  end
end
