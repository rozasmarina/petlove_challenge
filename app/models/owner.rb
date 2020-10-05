class Owner < ApplicationRecord
  has_many :pets

  # def can_have_swallow?
  #   DateTime.current.to_date - self.birthday > 18
  # end
end
