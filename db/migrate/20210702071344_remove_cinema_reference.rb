class RemoveCinemaReference < ActiveRecord::Migration[6.1]
  def change
    remove_column :cinemas, :movie_id
  end
end
