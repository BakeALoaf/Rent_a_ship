class Ship < ApplicationRecord
  belongs_to :user
  has_one_attached :picture
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, source: :ship, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name, against: [:name],
  using: {
    tsearch: { prefix: true }
  }
end
