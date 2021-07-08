class AddFeedbackToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :feedback, :text
  end
end
