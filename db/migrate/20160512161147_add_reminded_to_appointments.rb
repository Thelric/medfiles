class AddRemindedToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :reminded, :boolean
  end
end
