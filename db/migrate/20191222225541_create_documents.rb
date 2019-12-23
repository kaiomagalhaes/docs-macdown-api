class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.text :content, null: true
      t.references :folder, null: true, foreign_key: true

      t.timestamps
    end
  end
end
