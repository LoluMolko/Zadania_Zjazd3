class Book
  attr_accessor :title, :author, :borrowed, :returned

  def initialize(title, author, borrowed, returned)
    self.title = title
    self.author = author
    self.borrowed = borrowed
    self.returned = returned
  end
end

class Reader
  attr_accessor :name, :id, :books

  def initialize(name)
    self.name = name
    self.id = ""
    self.books = {}
  end
end

class Library
  attr_accessor :book_list, :reader_list

  def initialize
    self.book_list = {}
    self.reader_list = {}
  end

  def add_book(book)
    book_list[book.title] = book
  end

  def add_reader(reader)
    reader_list[reader.name] = reader
    reader_list[reader.name].id = reader.object_id
  end

  def borrow_book(name, title, date)
    if check_availability(title, date) == true
      book_list[title].borrowed = date
      book_list[title].returned = nil
      reader_list[name].books[title] = [date, nil]
    else
      puts "Book is not available"
    end
  end

  def check_availability(title, date)
    if book_list[title].returned != nil
      return true
    end
  end

  def return_book(name, title, date)
      book_list[title].returned = date
      reader_list[name].books[title][1] = date
  end

  def show_borrowed(name)
    puts "Reader Card"
    puts "Name: #{name}"
    puts "ID: #{reader_list[name].id}"
    puts "Books borrowed now:"
    reader_list[name].books.each_pair do |key, value|
      if value[1] == nil
        puts key
      end
    end
  end

  def show_history(name)
    puts "Reader History"
    puts "Name: #{name}"
    puts "ID: #{reader_list[name].id}"

    reader_list[name].books.each_pair do |key, value|
      puts key
      puts "Borrowed #{value[0]}"
        if value[1] == nil
          puts "Not returned yet"
        else
          puts "Returned on #{value[1]}"
        end
    end
  end
end

library = Library.new

book1 = Book.new("Don Quixote", "Miguel de Cervantes", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book2 = Book.new("In Search of Lost Time", "Marcel Proust", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book3 = Book.new("Ulysses", "James Joyce", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book4 = Book.new("The Odyssey","Homer", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book5 = Book.new("War and Peace", "Leo Tolstoy", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book6 = Book.new("The Divine Comedy", "Dante Alighieri", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book7 = Book.new("Hamlet", "William Shakespeare", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book8 = Book.new("The Adventures of Huckleberry Finn", "Mark Twain", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book9 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
book10 = Book.new("The Iliad", "Homer", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))

reader1 = Reader.new("Mary Roberts")
reader2 = Reader.new("John Smith")
reader3 = Reader.new("Randy Perkins")

library.add_book(book1)
library.add_book(book2)
library.add_book(book3)
library.add_book(book4)
library.add_book(book5)
library.add_book(book6)
library.add_book(book7)
library.add_book(book8)
library.add_book(book9)
library.add_book(book10)

library.add_reader(reader1)
library.add_reader(reader2)
library.add_reader(reader3)


library.borrow_book("Mary Roberts", "Don Quixote", Time.new(2018, 2, 5, 00, 00))
library.borrow_book("Mary Roberts", "In Search of Lost Time", Time.new(2018, 2, 5, 00, 00))
library.borrow_book("Mary Roberts", "Ulysses", Time.new(2018, 2, 5, 00, 00))
library.return_book("Mary Roberts", "Don Quixote", Time.new(2018, 3, 5, 00, 00))

library.show_borrowed("Mary Roberts")
library.show_history("Mary Roberts")

library.borrow_book("John Smith", "In Search of Lost Time", Time.new)
library.borrow_book("John Smith", "Don Quixote", Time.new)

library.show_borrowed("John Smith")
library.show_history("John Smith")
