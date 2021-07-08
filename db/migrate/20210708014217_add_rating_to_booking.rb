class AddRatingToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :rating, :integer
  end
end
