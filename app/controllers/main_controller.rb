#require  'lib/genetic_algorithm'
require  'genetic_algorithm'
#require  'lib/data_set'
require  'data_set'
#require  'lib/data_set'
require  'statistics'
#require  'lib/statistics'
require  'csv'

class MainController < ApplicationController

  def index
    redirec_to :action => "select_places" 
  end


  def select_places
    
  end

  def search
    places = Place.find(params[:table][:places_ids])
    @num_combinaciones = places.size ** places.size
    titles=Array.new
    file = File.new("#{RAILS_ROOT}/public/data/temporal.csv", "w")
    places.each{|place| titles << place.description }
    file.puts(titles.join(","))
    places.each{|place|
      values = Array.new
      places.each {|p| values << Distance.find(:first, :select => "kilometers", :conditions => ["from_id = ? AND to_id = ?", place.id, p.id]).kilometers}
      file.puts(values.join(","))
    }
    #ACALA,ARRIAGA,COPAINALA,ESCUINTLA,SOYALO,TAPACHULA,TUMBALA,TUXTLA GUTIERREZ,YAJALON
    file.close

    #---- Load data ---
         # Load data from data_set.csv
      @data_filename = "#{RAILS_ROOT}/public/data/temporal.csv"
      @data_set = Ai4r::Data::DataSet.new.load_csv_with_labels @data_filename
      @data_set.data_items.collect! {|column| column.collect {|element| element.to_f}}
      Ai4r::GeneticAlgorithm::Chromosome.set_cost_matrix(@data_set.data_items)
  end


  def index
      # Load data from data_set.csv
      @data_filename = "#{RAILS_ROOT}/public/data/lugares_short_version.csv"
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
      file = File.open("#{RAILS_ROOT}/public/data/lugares_sort_version.csv")
      @places = Hash.new
      counter=0
      array_of_values=[]
      # Create de hash keys
      list_places = file.readline.split(",")
      list_places.each do |place| 
        @places["#{place}"] = Hash.new
        list_places.each do |place_loop|
            if place_loop != place
             @places["#{place}"]["#{place_loop}"] = 0
            end
        end
      end



      file.each_line { |line|
        values = line.split(",")
        if counter > 0
          loop_counter=0
          list_places.each do |place_loop|
            @places["#{list_places[counter]}"]["#{place_loop}"] = values[loop_counter]
            loop_counter+=1
          end
        end
        counter+=1

        #Barcelona""Berlin""Brussels""Dublin""Hamburg""Kiev""London""Madrid""Milan""Moscow""Munich""Paris""Rome""Vienna""Warsaw"
#        0"1497.61""1062.89""1469.29""1471.78""2391.06""1137.67""504.64""725.12""3006.93""1054.55""831.59""856.69""1347.43""1862.33"
      }


      #places["barcelona"] = {"Moscow" => "234.5", "Hamburg" => "652.4"}

     # render :text => places.inspect
    end

end
