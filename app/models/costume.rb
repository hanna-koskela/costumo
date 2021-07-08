class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :price, presence: true
  # validate :booking_overlap_dates_new

  # Changes added for PgSearch
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [:title, :description],
    using: {
      tsearch: { prefix: true }
  }

  # a list of unavailable dates from https://medium.com/@sonia.montero/date-validations-and-flatpickr-setup-for-rails-24c78d6eb784
  def unavailable_dates
    bookings.pluck(:date_start, :date_end).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def unavailable_dates_edit(current_booking)
    bookings.where.not(id: current_booking.id).pluck(:date_start, :date_end).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  def average_rating
    rating_count = bookings.where("rating>=0").count
    rating_total = bookings.where("rating>=0").sum(:rating)

    return rating_count.positive? ? rating_total.to_f / rating_count : nil
  end

  def booking_overlap_dates_new
    # return if date_end.blank? || date_start.blank?
    # get the unavailble dates
    @unavailable_dates = costume.unavailable_dates()
    if @unavailable_dates.any? do |block|
        block[:from].between?(date_start, date_end) || block[:to].between?(date_start, date_end)
      end
      errors.add(:base, "Sorry, some dates selected are not available.")
    end
  end
end
