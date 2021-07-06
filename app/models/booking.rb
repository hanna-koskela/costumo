class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume

  # calendar validation from: https://medium.com/@sonia.montero/date-validations-and-flatpickr-setup-for-rails-24c78d6eb784
  validates :date_start, :date_end, presence: true
  validate :end_date_after_start_date # this is a method defined below
  validate :bookign_overlap_dates_edit # this is a method defined below

  private

  def end_date_after_start_date
    return if date_end.blank? || date_start.blank?

    errors.add(:date_end, "must be after the start date") if date_end < date_start
  end

  def bookign_overlap_dates_edit
    return if date_end.blank? || date_start.blank?

    # get the unavailble dates
    @unavailable_dates = costume.unavailable_dates_edit(self)
    if @unavailable_dates.any? do |block|
        block[:from].between?(date_start, date_end) || block[:to].between?(date_start, date_end)
      end
      errors.add(:base, "Sorry, some dates selected are not available.")
    end
  end
end
