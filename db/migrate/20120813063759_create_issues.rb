class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :details
      t.string :risk
      t.text :recommendation
      t.integer :project_id
      t.string :status 
      t.timestamps
    end
  end
end
