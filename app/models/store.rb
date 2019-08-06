class Store < ApplicationRecord
  validates :codename, presence: true
  validates :codename, :length => { :minimum => 5 }, allow_blank: true
  validates :address, :length => { :minimum => 10 }, allow_blank: true
  validates :phone, :length => { :minimum => 6 }, allow_blank: true

  validates_uniqueness_of :codename, case_sensitive: false, allow_blank: true

  # validates_format_of :codename, with: /^([a-z A-ZñáéíóúÑÁÉÍÓÚ[0-9]\s]+)$/, multiline: true, :allow_blank => true
  validates_format_of :phone, with: /^(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}$/, multiline: true, :allow_blank => true

  def self.get_index_columns
    exclude_columns = %w[id created_at updated_at]
    columns = Store.column_names
    columns - exclude_columns
  end
end
