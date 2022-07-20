class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rental_book(rental)
    return unless rental.instance_of?(Rental) && !@rentals.include?(rental)

    @rentals.push(rental)
    rental.book_rented(self)
  end
end
