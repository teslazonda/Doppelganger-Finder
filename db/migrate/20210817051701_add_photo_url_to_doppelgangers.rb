class AddPhotoUrlToDoppelgangers < ActiveRecord::Migration[6.0]
  def change
    add_column :doppelgangers, :photo_url, :string
  end
end
