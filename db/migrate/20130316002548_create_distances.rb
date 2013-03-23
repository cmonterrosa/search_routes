class CreateDistances < ActiveRecord::Migration
  def self.up
    create_table :distances do |t|
      t.integer :from_id, :to_id
      t.decimal :kilometers
    end

    # --- Create distance table ---
    file = File.open("#{RAILS_ROOT}/public/data/lugares_chiapas.csv")
    file.gets
    cities = Place.find(:all, :order => "id")
    counter_from=0
    file.each_line { |line|
      distances = line.split(",")
      from_city = cities[counter_from]
      counter_to = 1
      distances.each do |distance|
        Distance.create(:from_id => from_city.id, :to_id => counter_to, :kilometers => distance )
        puts("from_id => #{Place.find(from_city.id).description} to #{Place.find(counter_to).description} = #{distance}")
        counter_to+=1
      end
      counter_from+=1
    }
  end



  def self.down
    drop_table :distances
  end
end
