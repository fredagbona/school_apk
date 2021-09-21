class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :last_name 
      t.string :first_name 
      t.integer :age
    end
  end
end
