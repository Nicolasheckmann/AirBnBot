class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Entrez un email valide s'il vous plait! :)"} 
  validates :phone_number,
    presence: true,
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "Entrez un numéro de téléphone français valide s'il vous plait! :)" }

  has_many :reservations_as_guest, foreign_key: 'guest_id', class_name: "Reservation"
  has_many :listings , foreign_key: 'host_id', class_name: "Listing"
end
