class CreateCouncils < ActiveRecord::Migration
  def change
    create_table :councils do |t|

      t.timestamps
    end
  end
end
