require_relative('../models/vet')
require_relative('../models/pet')

Vet.delete_all()

vet1 = Vet.new({
  "first_name" => "Clive",
  "last_name" => "Jones",
  "phone_number" => "012345678910",
  "max_pets" => 5,
  "pet_count" => 3
  })

vet2 = Vet.new({
  "first_name" => "Ashley",
  "last_name" => "Carson",
  "phone_number" => "012345678910",
  "max_pets" => 8,
  "pet_count" => 8
  })

vet3 = Vet.new({
  "first_name" => "Cleveland",
  "last_name" => "Brown",
  "phone_number" => "012345678910",
  "max_pets" => 5,
  "pet_count" => 4
  })

vet1.save()
vet2.save()
vet3.save()



pet1 = Pet.new({
  "name" => "Raymond",
  "specie" => "Aligator",
  "breed" => "Sharptooth",
  "year_of_birth" => 2010,
  "notes" => "Very Sharp Teeth",
  "owner_name" => "Steven",
  "owner_phone" => "012345678910",
  "owner_address" => "1 Edinburgh Road",
  "vet_id" => vet2.id
  })

pet2 = Pet.new({
  "name" => "Patricia",
  "specie" => "Lion",
  "breed" => "Longhair",
  "year_of_birth" => 2005,
  "notes" => "Ferile Lion",
  "owner_name" => "Jerry",
  "owner_phone" => "012345678910",
  "owner_address" => "3 Castle Terrace",
  "vet_id" => vet3.id
  })

pet3 = Pet.new({
  "name" => "Wallace",
  "specie" => "Seahorse",
  "breed" => "Sea Shire",
  "year_of_birth" => 1997,
  "notes" => "Doesn't like being kept out of water",
  "owner_name" => "Ricardo",
  "owner_phone" => "012345678910",
  "owner_address" => "5 Old Town Road",
  "vet_id" => vet1.id
  })

pet1.save()
pet2.save()
pet3.save()
#
# pet2.year_of_birth = 2001
# pet2.update()
#
# p Vet.find(11)
# p Pet.find(16)


# vet2.delete()
# pet3.delete()


# Pet.delete_all()
# p Pet.all()



# p DateTime.now.year

# p Vet.all()

# vet2.last_name = "Clifton"
# vet2.update()
