require('sinatra')
require('sinatra/reloader')
require('sinatra/contrib/all')
require_relative('models/pet')
require_relative('models/vet')

# vet list
get '/vets' do
  @vets = Vet.all
  erb(:vets)
end

get '/pets' do
  @pets = Pet.all
  erb(:pets)
end
