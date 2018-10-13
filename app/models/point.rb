class Point

  attr_accessor :latitude, :longitude

  def initialize(longitude, latitude)
    @latitude = latitude
    @longitude = longitude
  end

  def mongoize
  	{type: 'Point', coordinates: [@longitude, @latitude]}
  end

  def self.demongoize(hash)
    if hash  
  	  longitude = hash[:coordinates][0]
      latitude = hash[:coordinates][1]
  	  return Point.new(longitude, latitude)
    else
      return nil
    end
  end

  def self.mongoize(input)
  	if input.is_a?(Point)
  		return input.mongoize
  	else
  		if input.is_a?(Hash)
  			return input
  		else
  			return nil
  		end
  	end
  end

  def self.evolve(input)
  	self.class.mongoize(input)
  end

end