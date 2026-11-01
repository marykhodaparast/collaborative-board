class CreatePages < ActiveRecord::Migration[8.1]
  def change
    create_table :pages do |t|
      t.references :board, null: false, foreign_key: true
      t.string :name, null: false, default: "Untitled page"
      t.integer :position, null: false, default: 1

      t.timestamps
    end

    add_index :pages, [:board_id, :position], unique: true
  end
end