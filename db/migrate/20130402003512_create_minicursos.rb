class CreateMinicursos < ActiveRecord::Migration
  def change
    create_table :minicursos do |t|
      t.string :title
      t.date :date_ini
      t.date :date_fim
      t.integer :vacancies
      t.references :palestrante

      t.timestamps
    end
    add_index :minicursos, :palestrante_id
  end
end
