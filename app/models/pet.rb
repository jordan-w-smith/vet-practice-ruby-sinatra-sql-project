require_relative('../db/sql_runner')

class Pet
  attr_accessor :name, :specie, :breed, :year_of_birth, :age, :notes, :vet_id, :owner_name, :owner_phone, :owner_address
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @specie = options['specie']
    @breed = options['breed']
    @year_of_birth = options['year_of_birth'].to_i
    @age = DateTime.now.year - @year_of_birth.to_i
    @notes = options['notes']
    @owner_name = options['owner_name']
    @owner_phone = options['owner_phone']
    @owner_address = options['owner_address']
    @vet_id = options['vet_id'].to_i
  end

  def save()
    sql = "INSERT INTO pets
    (
      name,
      specie,
      breed,
      year_of_birth,
      age,
      notes,
      owner_name,
      owner_phone,
      owner_address,
      vet_id
      )
      VALUES
      (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
      )
      RETURNING *"
    values= [
      @name,
      @specie,
      @breed,
      @year_of_birth,
      @age,
      @notes,
      @owner_name,
      @owner_phone,
      @owner_address,
      @vet_id
    ]
    pets_data = SqlRunner.run(sql, values)
    @id = pets_data.first()['id']
  end

  def self.all()
    sql = "SELECT * FROM pets"
    pets = SqlRunner.run(sql)
    result = pets.map { |pet| Pet.new(pet) }
    return result
  end

  def update()
    sql = "UPDATE pets
    SET
    (
      name,
      specie,
      breed,
      year_of_birth,
      age,
      notes,
      owner_name,
      owner_phone,
      owner_address,
      vet_id
      )
      =
      (
        $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
      )
      WHERE id = $11
      "
      values = [
        @name,
        @specie,
        @breed,
        @year_of_birth,
        @age,
        @notes,
        @owner_name,
        @owner_phone,
        @owner_address,
        @vet_id,
        @id
      ]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM pets
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM pets"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM pets
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    pet = Pet.new(result)
    return pet
  end

end
