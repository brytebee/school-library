require_relative '../src/classes/decorator'
require 'rspec/autorun'

describe Decorator do
  context 'when instantiated' do
    deco = Decorator.new('Joe')
  end
end
