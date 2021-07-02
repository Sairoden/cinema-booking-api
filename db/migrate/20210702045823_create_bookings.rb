class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.string :seat_number
      t.string :time_slot

      t.timestamps
    end
  end
end
