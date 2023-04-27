class RenameNoteToNotes < ActiveRecord::Migration[6.1]
  def change
    rename_column :spices, :note, :notes
  end
end
