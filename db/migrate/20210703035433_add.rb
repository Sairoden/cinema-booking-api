class Add < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :seat_number, :Integer, uniqueness: true
  end
end
