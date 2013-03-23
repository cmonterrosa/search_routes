class Distance < ActiveRecord::Base
  def from
    Place.find(self.from_id)
  end

  def to
    Place.find(self.to_id)
  end
end
