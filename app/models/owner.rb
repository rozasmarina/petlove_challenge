class Owner < ApplicationRecord
  has_many :pets
  validates :name, :document, :birthday, presence: true

  def can_have_swallow?
    Date.today - self.birthday >= 18
  end

  def can_have_cat?
    self.name[0].downcase != 'a'
  end
end
