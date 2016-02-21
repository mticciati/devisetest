class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|

    	t.string :job_title
    	t.integer :user_id	
    	t.integer :qualified
    	t.integer :applicants, default: 0
    	t.integer :archived, default: 0
      	t.timestamps null: false
    end
  end
end
