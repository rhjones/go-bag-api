class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
