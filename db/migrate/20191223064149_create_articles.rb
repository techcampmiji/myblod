class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string    :nickname
      t.text      :text
      t.timestamps
    end
  end
end
