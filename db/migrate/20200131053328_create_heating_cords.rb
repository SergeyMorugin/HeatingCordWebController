class CreateHeatingCords < ActiveRecord::Migration[5.2]
  def change
    create_table :heating_cords do |t|
      t.integer :mode, default: 0

      t.timestamps
    end
  end
end
