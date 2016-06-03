class CreateCensusApis < ActiveRecord::Migration
  def change
    create_table :census_apis do |t|

      t.timestamps null: false
    end
  end
end
