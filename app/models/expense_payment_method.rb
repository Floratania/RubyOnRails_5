# app/models/expense_payment_method.rb
class ExpensePaymentMethod < ApplicationRecord
  belongs_to :expense
  belongs_to :payment_method

  # Валідації
  # validates :expense_id
  # validates :payment_method_id
end
