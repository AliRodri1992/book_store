class CreateAsignBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :asign_books do |t|
      t.references :store, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
