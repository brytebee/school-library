def save_people
  # person_write = @people.map do |person|
  #   if person.instance_of?(Teacher)
  #     {
  #       name: person.name,
  #       age: person.age,
  #       specialization: person.specialization
  #     }
  #   elseif person.instance_of?(Student)
  #     {
  #       name: person.name,
  #       age: person.age
  #     }      
  #   end
  # end

  # File.open('./src/data/people.json', 'w') { |file| file.write(JSON.generate(person_write)) }
  person_write = []
  @people.each do |person|
    if (person.class == Student)
      person_write << {age: person.age, name: person.name}
    else
      person_write << {
        age: person.age,
        name: person.name,
        specialization: person.specialization
      }
    end

    File.open('./src/data/people.json', 'w') { |file| 
      file.write(JSON.generate(person_write))
    }
  end
end

def read_person_file
  return [] unless File.exist?('./src/data/people.json')

  persons = JSON.parse(File.read('./src/data/people.json'))
  persons.map do |person|
    if person['specialization']
      Teacher.new(person['age'], person['name'], person['specialization'])
    else
      Student.new(person['age'], person['name'], person['classroom'])
    end
  end
end
