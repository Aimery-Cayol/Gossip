require 'pry'
require 'csv'


class Gossip
	attr_accessor :author, :content 

	def initialize(author, content)
		@author = author
		@content = content

	end 

	def save
		CSV.open("/Users/aimery/desktop/thp/J5.1/the_gossip_project_sinatra/db/gossip.csv", "ab") do |csv|
		csv << [@author, @content]
		end 
	end 

	def self.all
	  all_gossips = []
	  CSV.read("/Users/aimery/desktop/thp/J5.1/the_gossip_project_sinatra/db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end
	  return all_gossips
	end

	def self.find(id)
		all_gossips = self.all
		all_gossips[id]
	end 

end

#binding.pry

#puts "end"
