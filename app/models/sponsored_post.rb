class SponsoredPost < ActiveRecord::Base
  has_many :comments
  belongs_to :topic

end
