class Book < ApplicationRecord
  paginates_per 10

  validates :title, presence: true
  validates :title, :length => { :minimum => 5 }, allow_blank: true
  validates :author, :length => { :minimum => 5 }, allow_blank: true
  validates :year, presence: true

  # validates_format_of :title, with: /^([a-z A-ZñáéíóúÑÁÉÍÓÚ[0-9]\s]+)$/, multiline: true, :allow_blank => true

  def self.get_index_columns
    exclude_columns = %w[id created_at updated_at]
    columns = Book.column_names
    columns - exclude_columns
  end
end
