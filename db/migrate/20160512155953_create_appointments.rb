class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :patient, index: true
      t.belongs_to :physician, index: true
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end
