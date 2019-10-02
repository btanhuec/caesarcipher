class CreateCiphers < ActiveRecord::Migration[5.2]
  def change
    create_table :ciphers do |t|
      t.integer :offset
      t.string :body

      t.timestamps
    end
  end
end
