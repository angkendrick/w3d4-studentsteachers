class Teachersstudents < ActiveRecord::Migration

  def change

    create_join_table :students, :teachers #alphabetical order

    remove_column :students, :teacher_id, :integer

  end

end