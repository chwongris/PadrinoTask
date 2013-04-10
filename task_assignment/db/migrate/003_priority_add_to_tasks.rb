class PriorityAddToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.integer :priority
    end
  end

  def self.down
    change_table :tasks do |t|
      t.remove :priority
    end
  end
end
