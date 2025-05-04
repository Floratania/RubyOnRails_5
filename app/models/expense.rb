# app/models/expense.rb
class Expense < ApplicationRecord
  # Зв’язки
  has_many :expense_categories, dependent: :destroy
  has_many :categories, through: :expense_categories

  has_many :expense_payment_methods, dependent: :destroy
  has_many :payment_methods, through: :expense_payment_methods

  # Валідації
  validates :amount, presence: true,
                     numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :date, presence: true
end
