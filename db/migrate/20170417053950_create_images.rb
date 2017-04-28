class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :caption
      t.integer :project_id
      t.boolean :is_primary, :default => false 

      t.timestamps
    end
  end
end
