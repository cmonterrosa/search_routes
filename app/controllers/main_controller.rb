require  'lib/genetic_algorithm'
require  'lib/data_set'
require  'lib/data_set'
require  'lib/statistics'
require  'csv'

class MainController < ApplicationController
  def index
      # Load data from data_set.csv
      @data_filename = "#{RAILS_ROOT}/public/data/travel_cost.csv"
      @data_set = Ai4r::Data::DataSet.new.load_csv_with_labels @data_filename
      @data_set.data_items.collect! {|column| column.collect {|element| element.to_f}}
      Ai4r::GeneticAlgorithm::Chromosome.set_cost_matrix(@data_set.data_items)

#      puts "Some random selected tours costs: "
#      3.times do
#        c = Ai4r::GeneticAlgorithm::Chromosome.seed
#        puts "COST #{-1 * c.fitness} TOUR: "+
#        "#{c.data.collect{|c| @data_set.data_labels[c]} * ', '}"
#      end
#      puts "Beginning genetic search, please wait... "
#      search = Ai4r::GeneticAlgorithm::GeneticSearch.new(800, 100)
#      result = search.run
#      puts "COST #{-1 * result.fitness} TOUR: "+
#      "#{result.data.collect{|c|@data_set.data_labels[c]} * ', '}"
#
#      
#      
    # $7611.99 TOUR: Moscow, Kiev, Warsaw, Hamburg, Berlin, Vienna, Munich, Milan, Rome, Barcelona, Madrid, Paris, Brussels, London, Dublin
      # $7659.81 TOUR: Moscow, Kiev, Warsaw, Vienna, Munich, Berlin, Hamburg, Brussels, Dublin, London, Paris, Milan, Rome, Barcelona, Madrid
      # $7596.74 TOUR: Moscow, Kiev, Warsaw, Berlin, Hamburg, Vienna, Munich, Milan, Rome, Barcelona, Madrid, Paris, Brussels, London Dublin
    end


    def dynamic_table
      file = File.open("#{RAILS_ROOT}/public/data/travel_cost.csv")
      places = Hash.new
      array_of_values=[]
      # Create de hash keys
      list_places = file.readline.split(",")
      file.move(1)
      list_places.each do |place| places["#{place}"] = Hash.new end
      file.each_line { |line|
        first_line ||= line.split(",")

        #Barcelona""Berlin""Brussels""Dublin""Hamburg""Kiev""London""Madrid""Milan""Moscow""Munich""Paris""Rome""Vienna""Warsaw"
#        0"1497.61""1062.89""1469.29""1471.78""2391.06""1137.67""504.64""725.12""3006.93""1054.55""831.59""856.69""1347.43""1862.33"
        array_of_values << line.split(",")
      }
      #places["barcelona"] = {"Moscow" => "234.5", "Hamburg" => "652.4"}

      render :text => array_of_values
    end

end
