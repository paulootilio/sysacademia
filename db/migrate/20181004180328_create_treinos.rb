class CreateTreinos < ActiveRecord::Migration[5.2]
  def change
    create_table :treinos do |t|
      t.references :cliente, foreign_key: true
      t.references :plano, foreign_key: true

      t.timestamps
    end
  end
end
