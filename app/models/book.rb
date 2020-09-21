class Book < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true, length: { maximum: 120}
    validates :author, presence: true
    validates :date_out, presence: true
    validates :date_back, presence: true
    enum status: [:out, :back]

end

