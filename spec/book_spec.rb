require_relative '../book'
require_relative '../student'

describe Book do
  before :each do
    @book = Book.new 'Title', 'Author'
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'returns the correct title' do
      expect(@book.title).to eql 'Title'
    end
  end

  describe '#author' do
    it 'returns the correct author' do
      expect(@book.author).to eql 'Author'
    end
  end

  it 'book rentals to be empty' do
    expect(@book.rentals).to eql []
  end

  it 'add a rental' do
    @student = Student.new('1', 'me', '2')
    expect(@book.rentals.length).to eql(0)
    @book.add_rental(@student, 'date')
    expect(@book.rentals.length).to eql(1)
  end
end
