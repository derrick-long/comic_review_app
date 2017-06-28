class AddColumnValueAsIntegerVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :value, :integer, default: 0
  end
end
