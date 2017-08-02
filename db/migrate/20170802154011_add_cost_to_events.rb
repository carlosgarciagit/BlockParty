class AddCostToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :cost, :string
  end
end
