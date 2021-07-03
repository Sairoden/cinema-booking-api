class ChangeAttributesSeatNumber < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :seat_number, :Integer, uniqueness: true
    change_column :cinemas, :available_seat, :Integer, default: 10


  end
end
