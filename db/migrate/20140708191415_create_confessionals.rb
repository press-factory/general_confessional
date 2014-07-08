class CreateConfessionals < ActiveRecord::Migration
  def change
    create_table :confessionals do |t|
      t.string :confessor
      t.text :confession

      t.timestamps
    end
  end
end
