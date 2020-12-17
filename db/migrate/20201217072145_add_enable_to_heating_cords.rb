class AddEnableToHeatingCords < ActiveRecord::Migration[5.2]
  def change
    add_column :heating_cords, :enable, :boolean, default: false
  end
end
