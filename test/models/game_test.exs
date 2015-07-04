defmodule Xadrez.GameTest do
  use Xadrez.ModelCase

  alias Xadrez.Game

  @valid_attrs %{black_id: 42, fen: "some content", white_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Game.changeset(%Game{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Game.changeset(%Game{}, @invalid_attrs)
    refute changeset.valid?
  end
end
