class CreateBallots < ActiveRecord::Migration[7.0]
  def change
    create_table :ballots do |t|
      t.string :name
      t.string :type
      t.references :election, null: false, foreign_key: true

      t.timestamps
    end
  end
end
