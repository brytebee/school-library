def save_people
  person_write = @people.map do |person|
    if person.instance_of?(Student)
      {
        name: person.name,
        age: person.age
      }
    else
      {
        name: person.name,
        age: person.age,
        specialization: person.specialization
      }
    end
  end

  File.open('./src/data/people.json', 'w') { |file| file.puts(JSON.pretty_generate(person_write)) }
end

def read_person_file
  if File.exist?('./src/data/people.json')
    persons = JSON.parse(File.read('./src/data/people.json'))
    persons.map do |person|
      if person['specialization']
        Teacher.new(person['age'], person['specialization'], person['name'])
      else
        Student.new(person['age'], person['classroom'], person['name'])
      end
    end
  else
    []
  end
end
