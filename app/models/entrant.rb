class Entrant
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  store_in collection: 'results'

  embeds_many :results, class_name: 'LegResult', order: [:"event.o".asc], after_add: :update_total

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
end
