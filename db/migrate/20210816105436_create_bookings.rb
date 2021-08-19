class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.integer :status, default: 0
      t.references :doppelganger, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :instructions

      t.timestamps
    end
  end
end
