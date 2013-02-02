class AddHeroUnitToSite < ActiveRecord::Migration
  def change
    add_column :sites, :hero_unit, :string
  end
end
