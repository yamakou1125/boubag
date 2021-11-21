class Category < ApplicationRecord

  enum type: { tool: 0, food: 1, others: 2 }
  self.inheritance_column = :_type_disabled

  has_many :items, dependent: :destroy

  validates :name, presence: true
  validates :type, presence: true

end
