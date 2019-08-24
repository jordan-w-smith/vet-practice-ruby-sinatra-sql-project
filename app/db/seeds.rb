require_relative('../models/vet')

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

vet1.save()
vet2.save()

vet2.last_name = "Clifton"
vet2.update()

# p Vet.all()
