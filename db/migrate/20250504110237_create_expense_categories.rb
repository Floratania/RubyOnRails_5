class CreateExpenseCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :expense_categories do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    # Забезпечимо унікальність зв’язку, щоб уникнути дублювання
    add_index :expense_categories, [:expense_id, :category_id], unique: true
  end
end
