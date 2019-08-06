class AsignBook < ApplicationRecord
  belongs_to :store
  belongs_to :book

  validates :quantity, presence: true
end
