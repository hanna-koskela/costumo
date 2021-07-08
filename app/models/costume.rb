class Costume < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :title, :price, presence: true

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
end
