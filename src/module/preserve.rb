module PreserveData
  def save_books
    data = []
    @books.each do |book|
      data.push( {author: book.author, title: book.title} )
    end

    File.open('./src/store/books.json', 'w') do |file|
      file.write(JSON.generate(data))
    end
  end

  def load_books
    return [] unless File.exists?('./src/store/books.json')

    JSON.parse(File.read('./src/store/books.json')).map do |book|
      Book.new(book['author'], book['title'])
    end
  end
end
