# app/models/expense_category.rb
class ExpenseCategory < ApplicationRecord
  belongs_to :expense
  belongs_to :category

  # Валідації
  # validates :expense_id
  # validates :category_id
end
