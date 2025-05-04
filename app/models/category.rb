# app/models/category.rb
class Category < ApplicationRecord
  # Зв’язки
  has_many :expense_categories, dependent: :destroy
  has_many :expenses, through: :expense_categories

  # Валідації
  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 50 }
end
