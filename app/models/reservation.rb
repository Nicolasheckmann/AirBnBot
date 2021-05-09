class Reservation < ApplicationRecord
  validates :start_date, presence: { message: "La date de début doit être au format valide"}
  validates :end_date, presence: { message: "La date de début doit être au format valide"}
  validate :start_date_must_be_before_end_date
  validate :overlaping_reservation?

  belongs_to :guest, class_name: "User"
  belongs_to :listing

  private
  def start_date_must_be_before_end_date
    return unless start_date && end_date
    errors.add(:start_date, "La date de début doit être antérieure à la date de fin") unless start_date < end_date
  end

  def duration
    return (end_date.mjd - start_date.mjd)
  end

  def overlaping_reservation?
    errors.add(:start_date, "Le logement choisis est déjà réservé pour cette période") if listing.overlaping_reservation?(start_date)
  end
end
