require  'lib/genetic_algorithm'
require  'lib/data_set'
require  'lib/data_set'
require   'lib/statistics'
require 'csv'

# Load data from data_set.csv
data_filename = "travel_cost.csv"
data_set = Ai4r::Data::DataSet.new.load_csv_with_labels data_filename
data_set.data_items.collect! {|column| column.collect {|element| element.to_f}}

Ai4r::GeneticAlgorithm::Chromosome.set_cost_matrix(data_set.data_items)

puts "Some random selected tours costs: "
3.times do
  c = Ai4r::GeneticAlgorithm::Chromosome.seed
  puts "COST #{-1 * c.fitness} TOUR: "+
   "#{c.data.collect{|c| data_set.data_labels[c]} * ', '}"
end

puts "Beginning genetic search, please wait... "
search = Ai4r::GeneticAlgorithm::GeneticSearch.new(800, 100)
result = search.run
puts "COST #{-1 * result.fitness} TOUR: "+
  "#{result.data.collect{|c| data_set.data_labels[c]} * ', '}"

# $7611.99 TOUR: Moscow, Kiev, Warsaw, Hamburg, Berlin, Vienna, Munich, Milan, Rome, Barcelona, Madrid, Paris, Brussels, London, Dublin
# $7659.81 TOUR: Moscow, Kiev, Warsaw, Vienna, Munich, Berlin, Hamburg, Brussels, Dublin, London, Paris, Milan, Rome, Barcelona, Madrid
# $7596.74 TOUR: Moscow, Kiev, Warsaw, Berlin, Hamburg, Vienna, Munich, Milan, Rome, Barcelona, Madrid, Paris, Brussels, London Dublin
