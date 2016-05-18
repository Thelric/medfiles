class CreatePhysicians < ActiveRecord::Migration
  def change
    create_table :physicians do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :us_phys_rels do |t|
      t.belongs_to :user, index: true
      t.belongs_to :physician, index: true

      t.timestamps null: false
    end
  end
end
