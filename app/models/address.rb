class Address
  include Mongoid::Document

#  attr_accessor :city, :state, :location

  field :city, type: String
  field :state, type: String
  field :location, as: :loc, type: Point

  def mongoize
  	{city: self.city, state: self.state, loc: self.location.mongoize}
  end

  def self.mongoize(input)
  	case input
  	when nil then nil
  	when Hash then input
  	when (Address) then input.mongoize
  	end
  end

  def self.demongoize(input)
  	case input
  	when nil then nil
  	when Hash
  		#puts input.inspect
  		city = input[:city]
  		state = input[:state]
  		loc = Point.new(input[:loc][:coordinates][0],input[:loc][:coordinates][1])
  		address = Address.new(city: city, state: state, loc: loc)
  		return address
  	when Address then input
  	end
  end

  def self.evolve(input)
  	self.class.mongoize(input)
  end

end