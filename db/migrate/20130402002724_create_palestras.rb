class CreatePalestras < ActiveRecord::Migration
  def change
    create_table :palestras do |t|
      t.string :title
      t.date :data
      t.time :hora
      t.references :palestrante

      t.timestamps
    end
    add_index :palestras, :palestrante_id
  end
end
