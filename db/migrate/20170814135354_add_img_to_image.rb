class AddImgToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :img, :string
  end
end
