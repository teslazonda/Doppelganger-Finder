class CreateDoppelgangers < ActiveRecord::Migration[6.0]
  def change
    create_table :doppelgangers do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
