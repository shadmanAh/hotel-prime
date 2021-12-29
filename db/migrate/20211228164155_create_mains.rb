class CreateMains < ActiveRecord::Migration[6.1]
  def change
    create_table :mains do |t|
      t.string :first_title
      t.text :first_description
      t.string :second_title
      t.text :second_description

      t.timestamps
    end
  end
end
