class AddModel < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string  :name, null: false
      t.string  :artist, null: false
      t.integer :plays, null: false, default: 0
    end
  end
end
