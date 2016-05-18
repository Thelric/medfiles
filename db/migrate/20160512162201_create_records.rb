class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :fecha
      t.text :body
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
