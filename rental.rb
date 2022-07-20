class Rental
  attr_reader :book
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book_rented(x)
    return "Invalid entry" unless x.instance_of?(Book)

    @book = x
    book.rental_book(self)
  end

  def person_rented(y)
    return "Invalid entry" unless y.instance_of?(Person)

    @person = y
    person.person_rental(self)
  end
end
