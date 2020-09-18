class Book < ApplicationRecord
    validates :Title, presence: true
    validates :Genre, presence: true
    validates :Author, presence: true
    validates :Price, presence: true, numericality: true
    validates :Published, presence: true
end
