module PreserveData
  def save_books
    data = []
    @books.each do |book|
      data << {title: book.title, author: book.author}
    end

    File.open('./src/store/books.json', 'w') do |file|
      file.write(JSON.generate(data))
    end
  end

  def load_books
    return [] unless File.exists?('./src/store/books.json')
    
  end
end