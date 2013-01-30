class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.string :headline
      t.text :content

      t.timestamps
    end
  end
end
