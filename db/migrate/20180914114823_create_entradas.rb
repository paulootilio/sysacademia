class CreateEntradas < ActiveRecord::Migration[5.2]
  def change
    create_table :entradas do |t|
      t.references :cliente, foreign_key: true
      t.references :plano, foreign_key: true
      t.references :modalidade, foreign_key: true
      t.string :descricao
      t.float :valor
      t.float :desconto
      t.float :total

      t.timestamps
    end
  end
end
