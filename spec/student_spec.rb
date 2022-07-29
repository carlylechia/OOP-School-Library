require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new 'Name', 11, 1
  end

  describe '#new' do
    it 'takes two parameters and returns a student object' do
      @student.should be_an_instance_of Student
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @student.name.should eql 'Name'
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      @student.age.should eql 11
    end
  end

  describe '#classroom' do
    it 'Should return the correct classroom of the student' do
      expect(@student.classroom).to eql 1
    end
  end

  describe '#play hooky ?' do
    it 'if it plays hooky ¯\(ツ)/¯' do
      expect(@student.play_hooky).to eql("¯\(ツ)/¯")
    end
  end
end
