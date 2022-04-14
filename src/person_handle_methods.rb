def save_people
  person_write = @people.map do |person|
    if person.instance_of?(Teacher)
      {
        name: person.name,
        age: person.age,
        specialization: person.specialization
      }
    else
      {
        name: person.name,
        age: person.age
      }
    end
  end

  File.write('./src/store/people.json', JSON.generate(person_write))
end

def read_person_file
  return [] unless File.exist?('./src/store/people.json')

  persons = JSON.parse(File.read('./src/store/people.json'))
  persons.map do |person|
    if person['specialization']
      Teacher.new(person['age'], person['name'], person['specialization'])
    else
      Student.new(person['age'], person['name'], person['classroom'])
    end
  end
end
