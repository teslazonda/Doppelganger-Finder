class AddAddressToDoppelgangers < ActiveRecord::Migration[6.0]
  def change
    add_column :doppelgangers, :address, :string
  end
end
