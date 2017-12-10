defmodule Zipgenius.Repo.Migrations.InitTimezonebyzipcodeSchema do
  use Ecto.Migration

  def change do
    create table(:timezonebyzipcode, primary_key: false) do
      add :idtimezonebyzipcode, :serial, primary_key: true
      add :zip, :string, size: 5
      add :city, :string, size: 45
      add :county, :string, size: 45
      add :state, :string, size: 2
      add :country, :string, size: 45
      add :timezone, :string, size: 45
      add :addressquality, :integer, size: 11
      add :source, :string, size: 45
      add :sourcedate, :date

      timestamps()
    end
  end
end
