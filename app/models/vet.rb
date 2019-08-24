require_relative('../db/sql_runner')

class Vet

  attr_accessor :first_name, :last_name, :pet_count, :available_slots
  attr_reader :max_pets

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
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
      max_pets,
      pet_count,
      available_slots
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING *"
    values = [
      @first_name,
      @last_name,
      @max_pets,
      @pet_count,
      @available_slots
    ]
    vets_data = SqlRunner.run(sql, values)
    @id = vets_data.first()['id'].to_i
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
      max_pets,
      pet_count,
      available_slots
      )
      =
      (
        $1, $2, $3, $4, $5, $6
      )
      WHERE id = $6
      "
      values = [
          @first_name,
          @last_name,
          @max_pets,
          @pet_cont,
          @available_slots,
          @id
      ]
      SqlRunner.run(sql, values)

  end













end
