class CreateVirus < ActiveRecord::Migration[5.1]
  def change
    create_table :viri do |t|
      t.string :profile
      t.string :risk_assessment
      t.string :date_discovered
      t.string :date_added
      t.string :origin
      t.string :length
      t.string :type_virus
      t.string :subtype
      t.string :dat_required
      t.string :description
      t.integer :key
    end
  end
end
