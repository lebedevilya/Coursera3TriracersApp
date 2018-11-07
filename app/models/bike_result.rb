class BikeResult < LegResult
  field :mph, type: Float

  def calc_ave
  	if event && secs
  	  miles = event.miles
  	  hours = secs / 3600
  	  self.mph = miles.nil? ? nil : miles / hours
  	end
  end
end