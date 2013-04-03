class AddTimeFimColumnToMinicurso < ActiveRecord::Migration
  def change
    add_column :minicursos, :time_fim, :time
  end
end
