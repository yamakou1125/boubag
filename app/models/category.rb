class Category < ApplicationRecord

  enum type: { tool: 0, food: 1, others: 2 }
  self.inheritance_column = :_type_disabled

end
