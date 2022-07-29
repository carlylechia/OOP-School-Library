require './student'
require './capitalizedecorator'
require './trimmerdecorator'
require './decorator'
require_relative '../nameable'

describe Nameable do
  before :each do
    person = Student.new('cindyangelzz', 12, 'class')
    @name = Decorator.new(person)
    @capitalize = CapitalizeDecorator.new(@name)
    @trimmed = TrimmerDecorator.new(@capitalize)
  end

  it 'returns the name' do
    expect(@name.correct_name).to eql('cindyangelzz')
  end

  it 'capitalizes the name' do
    expect(@capitalize.correct_name).to eql('Cindyangelzz')
  end

  it 'trims the name' do
    expect(@trimmed.correct_name).to eql('Cindyangel')
  end
end
