class CreateSetups < ActiveRecord::Migration
  def self.up
    create_table :setups do |t|
      t.string :site_uid
      t.string :account
      t.string :api_key
      t.integer :avatar_size
      t.string :color
      t.integer :num_items
      t.boolean :show_powered_by

      t.timestamps
    end
    add_index :setups, :site_uid
  end

  def self.down
    drop_table :setups
  end
end
