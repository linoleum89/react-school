defmodule App.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset
  alias App.Accounts.{Atendee, User}

  schema "events" do
    field :description, :string
    field :limit, :integer
    field :address, :string
    field :city, :string
    field :thumbnail_url, :string
    field :name, :string
    field :cost, :integer
    belongs_to :user, User
    many_to_many(:atendees, Atendee, join_through: "event_atendees")
    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :description, :address, :city, :thumbnail_url, :limit, :user_id])
    |> validate_required([:name, :description, :limit])
  end
end
