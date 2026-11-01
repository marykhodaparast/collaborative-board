class CreateDrawings < ActiveRecord::Migration[8.1]
  def change
    create_table :drawings do |t|
      t.references :page, null: false, foreign_key: true
      t.string :nickname, null: false
      t.string :tool, null: false, default: "pen"
      t.string :color, null: false, default: "#111827"
      t.float :stroke_width, null: false, default: 3.0
      t.text :data, null: false, default: "{}"

      t.timestamps
    end

    add_index :drawings, [:page_id, :created_at]
  end
end