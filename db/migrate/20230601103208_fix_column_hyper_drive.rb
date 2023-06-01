class FixColumnHyperDrive < ActiveRecord::Migration[7.0]
  def change
    rename_column :starships, :max_speed, :max_atmosphering_speed
  end
end
