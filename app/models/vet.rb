require_relative('../db/sql_runner')

class Vet

  attr_accessor :first_name, :last_name, :pet_count, :available_slots, :phone_number
  attr_reader :max_pets, :id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @phone_number = options['phone_number']
    @max_pets = options['max_pets'].to_i
    @pet_count = options['pet_count'].to_i
    @available_slots = @max_pets - @pet_count

    # options['available_slots'].to_i
  end

  def save()
    sql = "INSERT INTO vets
    (
      first_name,
      last_name,
      phone_number,
      max_pets,
      pet_count,
      available_slots
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [
      @first_name,
      @last_name,
      @phone_number,
      @max_pets,
      @pet_count,
      @available_slots
    ]
    vets_data = SqlRunner.run(sql, values)
    @id = vets_data.first()['id']
  end

  def self.all()
    sql = "SELECT * FROM vets"
    vets = SqlRunner.run(sql)
    result = vets.map { |vet| Vet.new(vet) }
    return result
  end

  def update()
    sql = "UPDATE vets
    SET
    (
      first_name,
      last_name,
      phone_number,
      max_pets,
      pet_count,
      available_slots
      )
      =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $7
      "
      values = [
          @first_name,
          @last_name,
          @phone_number,
          @max_pets,
          @pet_count,
          @available_slots,
          @id
      ]
      SqlRunner.run(sql, values)

  end

  def delete()
    sql = "DELETE FROM vets
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM vets"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM vets
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    vet = Vet.new(result)
    return vet
  end

end
