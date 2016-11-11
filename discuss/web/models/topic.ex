defmodule Discuss.Topic do
	
	use Discuss.Web, :model

	schema "topics" do
		field :title, :string
		belongs_to :user, Discuss.User
		has_many :comments, Discuss.Comment
	end

	# params \\ %{}: how to set params to default to empty map
	def changeset(struct, params \\ %{}) do
		struct
		|> cast(params, [:title])
		|> validate_required([:title])
	end

end