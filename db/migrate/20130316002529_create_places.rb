class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :description, :limit => 100
      t.float :latitude
      t.float :longitude
    end

  # Load cities
  file = File.open("#{RAILS_ROOT}/public/data/lugares_chiapas.csv")
  cities = file.readline.split(",")
  cities.each { |city|
    puts city
    Place.create(:description => city)
  }


  end


  def self.down
    drop_table :places
  end
end
