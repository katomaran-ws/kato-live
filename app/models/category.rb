class Category < ActiveRecord::Base

  has_many :articles

  validates :name, presence: true, uniqueness: true
  validates :alias_name, presence: true, uniqueness: true

  scope :by_active, -> { where('status =?', true) }

end
