class Cart < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5}
    validates :description, presence: true, length: {minimum: 5}
    has_one_attached :avatar
end