class RunResult < LegResult
  field :mmile, as: :minute_mile, type: Float

  def calc_ave
  	if event && secs
  	  miles = event.miles
  	  minutes = secs / 60
  	  self.mmile = miles.nil? ? nil : minutes / miles
  	end
  end
end