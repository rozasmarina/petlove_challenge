class Owner < ApplicationRecord
  has_many :pets

  def can_have_swallow?
    
  end
end
