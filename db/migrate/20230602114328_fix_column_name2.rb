class FixColumnName2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :starships, :passengers, :crew
  end
end
