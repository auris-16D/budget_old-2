class CreateResourcePolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :resource_policies do |t|
      t.string :resource_name
      t.references :action, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
