class AddToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.string :Description
    end
  end

  def self.down
    change_table :tasks do |t|
      t.remove :Description
    end
  end
end
