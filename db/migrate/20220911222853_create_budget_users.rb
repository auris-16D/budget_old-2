class CreateBudgetUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_users do |t|
      t.references :budget_space, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :is_owner

      t.timestamps
    end
  end
end
