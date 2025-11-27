# coverage
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/test/'
end

puts "Cobertura ativada: SimpleCov"

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Usar paralelização nativa do Rails
  parallelize(workers: :number_of_processors)

  # Carregar fixtures, caso existam
  fixtures :all
end
