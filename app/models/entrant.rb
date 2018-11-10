class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  store_in collection: 'results'

  embeds_many :results, class_name: 'LegResult', order: [:"event.o".asc], after_add: :update_total
  embeds_one :race, class_name: 'RaceRef'
  embeds_one :racer, class_name: 'RacerInfo'

  field :bib, type: Integer
  field :secs, type: Float
  field :o, as: :overall, type: Placing
  field :gender, type: Placing
  field :group, type: Placing

  def update_total(result)
  	sum = 0
  	results.each do |res|
  	  sum += res.secs
  	end
    self.secs=sum
  end

  def the_race
  	race.race
  end
end
