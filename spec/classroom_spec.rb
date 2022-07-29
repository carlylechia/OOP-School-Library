require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Lable'
  end

  describe '#new' do
    it 'takes one parameters and returns a classroom object' do
      @classroom.should be_an_instance_of Classroom
    end
  end

  describe '#lable' do
    it 'returns the correct lable' do
      @classroom.label.should eql 'Lable'
    end
  end

  describe '#add_student method test' do
    it 'Should return two students' do
      chia = Student.new('Chia', 20, parent_permission: true)
      olivier = Student.new('Olivier', 25, parent_permission: false)
      @classroom.add_student(chia)
      @classroom.add_student(olivier)
      expect(@classroom.student_array.length).to eql 2
    end

    it 'Should return the classroom of the student' do
      olivier = Student.new(25, 'Olivier', parent_permission: true)
      @classroom.add_student(olivier)
      expect(olivier.classroom).to eql @classroom
    end
  end
end
