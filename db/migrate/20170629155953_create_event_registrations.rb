class CreateEventRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :event_registrations do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :status

      t.timestamps
    end

    add_index :event_registrations, [:user_id, :event_id]
  end
end
