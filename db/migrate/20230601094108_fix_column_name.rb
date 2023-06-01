class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :starships, :passangers, :passengers
  end
end
