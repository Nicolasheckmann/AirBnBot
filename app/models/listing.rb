class Listing < ApplicationRecord
  validates :available_beds,
    presence: true,
    numericality: { greater_than: 0, message: "Le nombre de lits disponible doit être de un ou plus"}
    
  validates :price,
    presence: true,
    numericality: { greater_than: 0, message: "Le prix doit être positif"}

  validates :description,
    presence: true,
    length: { minimum: 140 }

  validates :welcome_message,
    presence: true

  belongs_to :host, class_name: "User"
  has_many :reservations
  belongs_to :city

  def overlaping_reservation?(datetime)
    self.reservations.any? { |reservation| reservation.start_date <= datetime && datetime < reservation.end_date }
  end
end
