module PreserveData
  def save_books
    data = []
    @books.each do |book|
      data.push({ author: book.author, title: book.title })
    end

    File.write('./src/store/books.json', JSON.generate(data))
  end

  def load_books
    return [] unless File.exist?('./src/store/books.json')

    JSON.parse(File.read('./src/store/books.json')).map do |book|
      Book.new(book['author'], book['title'])
    end
  end
end
