class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.text :description, null: false
      t.datetime :date, null: false, default: -> { 'CURRENT_TIMESTAMP' }


      t.timestamps
    end
  end
end
