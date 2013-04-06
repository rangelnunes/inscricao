class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.string :institution
      t.references :minicurso

      t.timestamps
    end
    add_index :users, :minicurso_id
  end
end
