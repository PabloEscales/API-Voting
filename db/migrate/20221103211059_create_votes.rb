class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.string :value
      t.references :registration, null: false, foreign_key: true
      t.references :ballot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
