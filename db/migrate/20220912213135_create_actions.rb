class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    # Action.create(name: "read")
    # Action.create(name: "write")
    # Action.create(name: "update")
    # Action.create(name: "delete")
    # Action.create(name: "full")
  end
end
