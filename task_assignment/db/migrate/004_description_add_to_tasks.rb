class DescriptionAddToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.string :description
    end
  end

  def self.down
    change_table :tasks do |t|
      t.remove :description
    end
  end
end
