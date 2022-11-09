class AddOptionsToBallots < ActiveRecord::Migration[7.0]
  def change
    add_column :ballots, :options, :string
  end
end
