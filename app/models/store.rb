class Store < ApplicationRecord
  def self.get_index_columns
    exclude_columns = %w[id created_at updated_at]
    columns = Store.column_names
    columns - exclude_columns
  end
end
