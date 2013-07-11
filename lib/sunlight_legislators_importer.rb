require 'csv'
require_relative '../app/models/legislator'

class SunlightLegislatorsImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/legislators.csv")
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      title = row['title']
      name = row['firstname']
      name += " #{row['middlename']}" if row['middlename'] != ''
      name += " #{row['lastname']}" if row['lastname'] != ''
      name += " #{row['name_suffix']}" if row['name_suffix'] != ''
      party = row['party']
      state = row['state']
      in_office = row['in_office'].to_i
      gender = row['gender']
      phone = row['phone']
      fax = row['phone']
      website = row['website']
      webform = row['webform']
      twitter_id = row['twitter_id']
      birthdate = row['birthdate']

      Legislator.create!({title: title, name: name, party: party, state: state,
                 in_office: in_office, gender: gender, phone: phone, fax: fax,
                 website: website, webform: webform, twitter_id: twitter_id,
                 birthdate: birthdate})
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
