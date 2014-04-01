class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.string :link

      t.timestamps
    end
  end
end
