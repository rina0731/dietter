class Contact < ApplicationRecord
	belongs_to :user

    validates :contact_title, presence: true, length: { in: 1..30}
	validates :contact_text, presence: true, length: { in: 2..500}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :reply, presence: true, format: { with: VALID_EMAIL_REGEX }
end
