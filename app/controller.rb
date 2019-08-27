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

get '/vets/new' do
  erb(:new_vet)
end

post '/vets' do
  @vet = Vet.new(params)
  @vet.save()
  erb(:create_vet_success)
end

get '/vets/:id' do
  @vet = Vet.find(params[:id])
  erb(:vet_details)
end



get '/pets' do
  @pets = Pet.all
  erb(:pets)
end

get '/pets/new' do
  @vets = Vet.all
  erb(:new_pet)
end

post '/pets' do
  @pet = Pet.new(params)
  @pet.save()
  erb(:create_pet_success)
end

get '/pets/:id' do
  @pet = Pet.find(params[:id])
  @vet = Vet.find(@pet.vet_id)
  erb(:pet_details)
end
