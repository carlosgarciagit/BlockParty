class AddCapacityToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :capacity, :integer, null: 1000
  end
end
