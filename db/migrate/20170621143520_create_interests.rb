class CreateInterests < ActiveRecord::Migration[5.1]
  def change
    create_table :interests do |t|
      t.string :name

      t.timestamps
    end

    add_index :interests, :name, unique: true
  end
end
