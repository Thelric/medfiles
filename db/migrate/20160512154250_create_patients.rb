class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :appat
      t.string :apmat
      t.string :name
      t.string :sex
      t.decimal :age
      t.string :eciv
      t.string :calle
      t.decimal :cnum
      t.string :tcasa
      t.string :tof
      t.string :cel

      t.timestamps null: false
    end

    create_table :us_pat_rels do |t|
      t.belongs_to :user, index: true
      t.belongs_to :patient, index: true

      t.timestamps null: false
    end
  end
end
