class CreateCinemas < ActiveRecord::Migration[6.1]
  def change
    create_table :cinemas do |t|
      t.string :title
      t.integer :available_seat
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
