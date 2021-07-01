class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume

  # calendar validation from: https://medium.com/@sonia.montero/date-validations-and-flatpickr-setup-for-rails-24c78d6eb784
  validates :date_start, :date_end, presence: true
  validate :end_date_after_start_date # this is a method defined below

  private

  def end_date_after_start_date
    return if date_end.blank? || date_start.blank?

    if date_end < date_start
      errors.add(:date_end, "must be after the start date")
    end
 end
end
