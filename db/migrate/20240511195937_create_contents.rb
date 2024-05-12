class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
