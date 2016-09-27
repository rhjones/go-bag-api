class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :item, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true
      t.boolean :packed

      t.timestamps null: false
    end
  end
end
