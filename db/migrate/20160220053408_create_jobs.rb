class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|

    	t.string :job_title
    	t.integer :user_id	
    	t.integer :qualified
      	t.timestamps null: false
    end
  end
end
