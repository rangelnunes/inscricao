class AddTimeIniColumnToMinicurso < ActiveRecord::Migration
  def change
    add_column :minicursos, :time_ini, :time
  end
end
