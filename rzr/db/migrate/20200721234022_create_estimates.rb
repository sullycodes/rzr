class CreateEstimates < ActiveRecord::Migration[6.0]
  def change
    create_table :estimates do |t|
      t.string :site
      t.string :address
      t.integer :price

      t.timestamps
    end
  end
end
