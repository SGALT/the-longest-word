class AddPartiesCountToGame < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :parties_count, :integer
  end
end
