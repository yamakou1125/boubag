class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category, optional: true

  validates :name, presence: true
  validates :category_id, presence: true
  validates :amount, presence: true, numericality: true

end
