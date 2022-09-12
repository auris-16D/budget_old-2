class CreateUserResourcePolicies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_resource_policies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :resource_policy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
