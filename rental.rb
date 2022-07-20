class Rental
  attr_reader :book
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
  end

  def book_rented(book)
    return 'Invalid entry' unless book.instance_of?(Book)

    @book = book
    book.rental_book(self)
  end

  def person_renting(person)
    return 'Invalid entry' unless person.instance_of?(Person)

    @person = person
    person.personal_rental(self)
  end
end
