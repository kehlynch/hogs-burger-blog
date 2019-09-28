class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :author
      t.text :body
      t.text :answer

      t.timestamps
    end

    create_table :question_comments do |t|
      t.string :commenter
      t.text :body
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
