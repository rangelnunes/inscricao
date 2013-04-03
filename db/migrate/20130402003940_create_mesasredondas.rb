class CreateMesasredondas < ActiveRecord::Migration
  def change
    create_table :mesasredondas do |t|
      t.string :title
      t.date :data
      t.references :palestrante

      t.timestamps
    end
    add_index :mesasredondas, :palestrante_id
  end
end
