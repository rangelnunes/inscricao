class CreatePalestrantes < ActiveRecord::Migration
  def change
    create_table :palestrantes do |t|
      t.string :name
      t.string :institution
      t.string :lattes

      t.timestamps
    end
  end
end
