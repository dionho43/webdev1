class AddBuyerandsoldToItem < ActiveRecord::Migration
  def change
    add_column :items, :buyer, :string
    add_column :items, :sold, :boolean
  end
end
