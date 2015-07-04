defmodule Xadrez.Game do
  use Xadrez.Web, :model

  schema "games" do
    field :white_id, :integer
    field :black_id, :integer
    field :fen, :string

    timestamps
  end

  @required_fields ~w(white_id black_id fen)
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
