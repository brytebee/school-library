require '../src/classes/decorator'
require 'rspec/autorun'

describe Decorator do
  context 'when instantiated' do
    deco = Decorator.new('Joe')

    it 'with a name' do
      expect(deco.class).to eq(Decorator)
    end

    it 'with a name' do
      expect(deco.nameable).to eq('Joe')
    end
  end
end
