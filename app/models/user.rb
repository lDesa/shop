class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  
  validates :phone_number,  format: { with: /\A[0-9]{11}\z/}, :allow_blank => true
  validates :name, length: { maximum: 20 }
  validates :surname, length: { maximum: 30 }
end
