class ChangeLimitForPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :starships, :price, :integer, limit: 8
  end
end
