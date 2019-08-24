require_relative('../models/vet')
require_relative('../models/pet')

vet1 = Vet.new({
  "first_name" => "Clive",
  "last_name" => "Jones",
  "max_pets" => 5,
  "pet_count" => 3
  })

vet2 = Vet.new({
  "first_name" => "Ashley",
  "last_name" => "Carson",
  "max_pets" => 8,
  "pet_count" => 8
  })

vet3 = Vet.new({
  "first_name" => "Cleveland",
  "last_name" => "Brown",
  "max_pets" => 5,
  "pet_count" => 4
  })

vet1.save()
vet2.save()
vet3.save()

vet2.last_name = "Clifton"
vet2.update()

pet1 = Pet.new({
  "name" => "Raymond",
  "specie" => "Aligator",
  "breed" => "Sharptooth",
  "year_of_birth" => 2010,
  "vet_id" => vet2.id
  })

pet2 = Pet.new({
  "name" => "Patricia",
  "specie" => "Lion",
  "breed" => "Longhair",
  "year_of_birth" => 2005,
  "vet_id" => vet3.id
  })

pet3 = Pet.new({
  "name" => "Wallace",
  "specie" => "Seahorse",
  "breed" => "Sea Shire",
  "year_of_birth" => 1997,
  "vet_id" => vet1.id
  })

pet1.save()
pet2.save()
pet3.save()

pet2.year_of_birth = 2001
pet2.update()
# vet2.delete()
# pet3.delete()

# Vet.delete_all()
# Pet.delete_all()
# p Pet.all()



# p DateTime.now.year

# p Vet.all()
