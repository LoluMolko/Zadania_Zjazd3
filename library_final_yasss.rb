class Book
  attr_accessor :title, :author, :borrowed, :returned

  def initialize(title, author, borrowed, returned)
    @title = title
    @author = author
    @borrowed = borrowed
    @returned = returned
  end
end

class Reader
  attr_accessor :name, :id, :books

  def initialize(name)
    @name = name
    @id = ""
    @books = {}
  end
end

class Library
  attr_accessor :book_list, :reader_list

  def initialize
    @book_list = {}
    @reader_list = {}
  end

  def add_book(title, author, borrowed, returned)
    @book_list[title] = Book.new(title, author, borrowed, returned)
  end

  def add_reader(name)
    @reader_list[name] = Reader.new(name)
    @reader_list[name].id = create_id
  end

  def create_id(length=10)
    chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    id = ''
    length.times {id << chars[rand(chars.size)]}
    while check_if_unique(id) != true
      length.times {id << chars[rand(chars.size)]}
    end
    id
  end

  def check_if_unique(id)
    @reader_list.each_value do |value|
      result = value.id

      if result == id
        return false
      end
    end
    true
  end

  def borrow_book(name, title, date)
    if check_availability(title, date) == true
      @book_list[title].borrowed = date
      @book_list[title].returned = nil
      @reader_list[name].books[title] = [date, nil]
    else
      puts "Book is not available"
    end
  end

  def check_availability(title, date)
    if @book_list[title].returned != nil
      return true
    end
  end

  def return_book(name, title, date)
      @book_list[title].returned = date
      @reader_list[name].books[title][1] = date
  end

  def show_borrowed(name)
    puts "Reader Card"
    puts "Name: #{name}"
    puts "ID: #{@reader_list[name].id}"
    puts "Books borrowed now:"
    @reader_list[name].books.each_pair do |key, value|
      if value[1] == nil
        puts key
      end
    end
  end

  def show_history(name)
    puts "Reader History"
    puts "Name: #{name}"
    puts "ID: #{@reader_list[name].id}"

    @reader_list[name].books.each_pair do |key, value|
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

library.add_book("Don Quixote", "Miguel de Cervantes", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("In Search of Lost Time", "Marcel Proust", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("Ulysses", "James Joyce", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("The Odyssey","Homer", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("War and Peace", "Leo Tolstoy", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("The Divine Comedy", "Dante Alighieri", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("Hamlet", "William Shakespeare", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("The Adventures of Huckleberry Finn", "Mark Twain", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("The Great Gatsby", "F. Scott Fitzgerald", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))
library.add_book("The Iliad", "Homer", Time.new(2018, 1, 1, 00, 00), Time.new(2018, 1, 1, 00, 00))

library.add_reader("Mary Roberts")
library.add_reader("John Smith")
library.add_reader("Randy Perkins")

library.borrow_book("Mary Roberts", "Don Quixote", Time.new(2018, 2, 5, 00, 00))
library.borrow_book("Mary Roberts", "In Search of Lost Time", Time.new(2018, 2, 5, 00, 00))
library.borrow_book("Mary Roberts", "Ulysses", Time.new(2018, 2, 5, 00, 00))
library.return_book("Mary Roberts", "Don Quixote", Time.new(2018, 3, 5, 00, 00))

#library.show_borrowed("Mary Roberts")
#library.show_history("Mary Roberts")

library.borrow_book("John Smith", "In Search of Lost Time", Time.new)
library.borrow_book("John Smith", "Don Quixote", Time.new)

library.show_borrowed("John Smith")
library.show_history("John Smith")
