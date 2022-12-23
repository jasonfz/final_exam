class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.float :reserve_price
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
