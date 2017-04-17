class RenameArtworkShares < ActiveRecord::Migration[5.0]
  def change
    rename_table :artworks_shares, :artwork_shares
  end
end
