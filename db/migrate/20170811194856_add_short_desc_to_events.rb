class AddShortDescToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :short_desc, :string
  end
end
