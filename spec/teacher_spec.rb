require './src/classes/teacher'

describe Teacher do
  context 'testing the teacher class' do
    before(:each) do
      @teacher1 = Teacher.new(34, 'teacher', 'hill')
      @teacher3 = Teacher.new(84, 'chemistry', 'james')
    end

    it 'should take 3 parameters and return the Teacher object' do
      expect(@teacher1.instance_of?(Teacher)).to be(true)
      expect(@teacher3.instance_of?(Teacher)).to be(true)
    end

    it 'should use service return true' do
      expect(@teacher1.can_use_services?).to be(true)
    end
  end
end
