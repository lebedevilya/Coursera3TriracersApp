class Placing
	include Mongoid::Document

	field :name, type: String
	field :place, type: Integer

	def mongoize
	  {name: self.name, place: self.place}
	end

	def self.mongoize(input)
  	  case input
  	  when nil then nil
  	  when Hash then input
  	  when Placing then input.mongoize
  	  end
	end

	def self.demongoize(input)
	  case input
	  when nil then nil
	  when Hash then Placing.new(name: input[:name], place: input[:place])
	  when Placing then input
	  end
	end

	def self.evolve(input)
		self.class.mongoize(input)
	end
end