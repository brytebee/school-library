module PreserveData
  def save_books
    data = []
    @books.each do |book|
      data.push({ title: book.title, author: book.author })
    end

    File.write('./src/store/books.json', JSON.generate(data))
  end

  def load_books
    return [] unless File.exist?('./src/store/books.json')

    JSON.parse(File.read('./src/store/books.json')).map do |book|
      Book.new(book['title'], book['author'])
    end
  end
end
