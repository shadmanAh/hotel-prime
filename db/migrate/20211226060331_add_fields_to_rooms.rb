class AddFieldsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :short_description, :text
    add_column :rooms, :size, :integer, default: "20", null: false
    add_column :rooms, :view, :string
    add_column :rooms, :bed, :integer, default: "1", null: false
    add_column :rooms, :price, :integer, default: "50", null: false
    add_column :rooms, :opacity, :integer, default: "1", null: false
  end
end
