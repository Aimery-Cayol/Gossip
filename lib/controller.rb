require 'gossip'

class ApplicationController < Sinatra::Base
  
  get '/' do
	erb :index, locals: {gossips: Gossip.all}
  end

  post '/gossips/new/' do
  	#puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
 	Gossip.new(params["gossip_author"], params["gossip_content"]).save
 	redirect '/'
  end


  get '/gossips/new/' do
  erb :new_gossip
  end

  get '/gossips/:id' do
  	erb :show, locals: {gossip: Gossip.find(params["id"].to_i)}
  end

end



