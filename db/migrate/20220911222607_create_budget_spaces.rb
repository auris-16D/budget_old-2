class CreateBudgetSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_spaces do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end