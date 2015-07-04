defmodule Xadrez.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :white_id, :integer
      add :black_id, :integer
      add :fen, :string

      timestamps
    end

  end
end
