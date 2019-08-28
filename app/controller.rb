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

#create new vet

get '/vets/new' do
  erb(:new_vet)
end

post '/vets' do
  @vet = Vet.new(params)
  @vet.save()
  erb(:create_vet_success)
end

# edit existing vet details

get '/vets/:id/edit' do
  @vet = Vet.find(params[:id])
  erb(:edit_vet)
end

post '/vets/:id' do
  Vet.new(params).update
  redirect to '/vets'
end

# delete vet

post '/vets/:id/delete' do
  vet = Vet.find(params[:id])
  vet.delete()
  redirect to '/vets'
end

# view individual vet details

get '/vets/:id' do
  @vet = Vet.find(params[:id])
  erb(:vet_details)
end

# get all pets

get '/pets' do
  @pets = Pet.all
  @vets = Vet.all
  erb(:pets)
end

# create new pet

get '/pets/new' do
  @vets = Vet.all
  erb(:new_pet)
end

post '/pets' do
  @pet = Pet.new(params)
  @pet.save()
  erb(:create_pet_success)
end

# edit pet

get '/pets/:id/edit' do
  @pet = Pet.find(params[:id])
  @vets = Vet.all()
  erb(:edit_pet)
end

post '/pets/:id' do
  Pet.new(params).update
  redirect to '/pets'
end

# delete pet

post '/pets/:id/delete' do
  pet = Pet.find(params[:id])
  pet.delete()
  redirect to '/pets'
end



# show individual pet details

get '/pets/:id' do
  @pet = Pet.find(params[:id])
  @vet = Vet.find(@pet.vet_id)
  erb(:pet_details)
end
