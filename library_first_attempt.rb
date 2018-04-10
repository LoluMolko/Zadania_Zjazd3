require "pry"

class Book
  attr_accessor :name, :author, :time_borrow, :time_return

  def initialize(name, author)
    self.name = name
    self.author = author
    @time_borrow = Time.new(2018, 1, 1, 00, 00)
    @time_return = Time.new(2018, 1, 1, 00, 00)
  end
end

class Library
  attr_accessor :book_list

  def initialize
    @book_list = {}
  end

  def add_book(book, status)
    book_list[book] = "Available"
  end

  def take_book(book_name)
    book_list.each do |key, value|
      if key.name == book_name && book_list[key] == "Available"
        book_list[key] = "Unavailable"
        return key
      else
        return nil
      end
    end
  end

  def shelf_book(book_name)
    book_list.each do |key, value|
      if key.name == book_name
        book_list[key] = "Available"
        return key
      end
    end
  end
end

class Reader
  attr_accessor :name, :reading_list

  def initialize(name)
    self.name = name
    @reading_list = []
  end

  def borrow_book(library, book_name)
    book = library.take_book(book_name)
      if book
        @reading_list << book
      end
  end

  def return_book(library, book_name)
    book = library.shelf_book(book_name)
    @reading_list.each_with_index do |item, index|
      if item == book
        @reading_list.delete_at(index)
      end
    end
  end
end


book1 = Book.new("Don Quixote", "Miguel de Cervantes")
book2 = Book.new("In Search of Lost Time", "Marcel Proust")
book3 = Book.new("Ulysses", "James Joyce")
book4 = Book.new("The Odyssey","Homer")
book5 = Book.new("War and Peace", "Leo Tolstoy")
book6 = Book.new("The Divine Comedy", "Dante Alighieri")
book7 = Book.new("Hamlet", "William Shakespeare")
book8 = Book.new("The Adventures of Huckleberry Finn", "Mark Twain")
book9 = Book.new("The Great Gatsby", "F. Scott Fitzgerald")
book10 = Book.new("The Iliad", "Homer")

library = Library.new

library.add_book(book1, 2)
library.add_book(book2, 2)
library.add_book(book4, 3)
library.add_book(book5, 2)
library.add_book(book6, 1)
library.add_book(book7, 1)
library.add_book(book8, 2)
library.add_book(book9, 2)
library.add_book(book10, 3)

reader1 = Reader.new("Mary Roberts")
reader2 = Reader.new("John Smith")
reader3 = Reader.new("Randy Perkins")

reader1.borrow_book(library, "Don Quixote")
reader2.borrow_book(library, "Don Quixote")

puts reader1.reading_list.inspect
puts reader2.reading_list.inspect
