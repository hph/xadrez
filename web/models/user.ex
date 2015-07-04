defmodule Xadrez.User do
  use Xadrez.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string
    timestamps

    has_many :white_games, Xadrez.User, foreign_key: :white_id
    has_many :black_games, Xadrez.User, foreign_key: :black_id
  end

  @required_fields ~w(email password)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
