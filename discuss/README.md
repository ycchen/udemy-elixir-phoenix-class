# Discuss

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

Request
 |
Router
 |
Controller <- Model <- Database
 |
View < - Template
 |
Response

## Generate migration for Topic

$ mix ecto.gen.migration add_topics

Keyword: 
import: Take all the functions out of this module and give them to this other module
alias: Give me a shorcut to this other module , my fingers are lazy
use: I want to do some really fancy setup

## Create topic model

## Add changest method to validate 

Struct: A hash that contains some data. Represents a record (or a record we want to save) in database

Params: A hash that contains the properties we want to update the struct with

cast: produces a changeset( produces what needs to be the final changeset to update database)

validators: adds errors to changeset

changeset: Knows the data we're trying to save and whether or not there are validation issues with it

> iex -S mix

# struct is a struct data type
> struct = %Discuss.Topic{}
%Discuss.Topic{__meta__: #Ecto.Schema.Metadata<:built, "topics">,
 id: nil, title: nil}

> params = %{title: "Greate JS"}  # params is a map

# changeset is not only the function, it's also name of an object 
> Discuss.Topic.changeset(struct, params)
#Ecto.Changeset<action: nil,
 changes: %{title: "Greate JS"}, errors: [],
 data: #Discuss.Topic<>, valid?: true>

* When passing empty params to changeset

> Discuss.Topic.changeset(struct, %{})
#Ecto.Changeset<action: nil, changes: %{},
 errors: [title: {"can't be blank", []}],
 data: #Discuss.Topic<>, valid?: false>
 
 Module Plug: 
 (init) : Do some setup
 (call) : called with a conn, must return a conn

 Function Plug


 > iex -S mix phoenix.server

 iex(2)> Phoenix.View.render(Discuss.PageView, "index.html", %{})
{:safe,
 [[["" | "<div class=\"jumbotron\">\n  <h2>"] | "Welcome to Phoenix!"] |
  "</h2>\n  <p class=\"lead\">A productive web framework that<br />does not compromise speed and maintainability.</p>\n</div>\n\n<div class=\"row marketing\">\n  <div class=\"col-lg-6\">\n    <h4>Resources</h4>\n    <ul>\n      <li>\n        <a href=\"http://phoenixframework.org/docs/overview\">Guides</a>\n      </li>\n      <li>\n        <a href=\"https://hexdocs.pm/phoenix\">Docs</a>\n      </li>\n      <li>\n        <a href=\"https://github.com/phoenixframework/phoenix\">Source</a>\n      </li>\n    </ul>\n  </div>\n\n  <div class=\"col-lg-6\">\n    <h4>Help</h4>\n    <ul>\n      <li>\n        <a href=\"http://groups.google.com/group/phoenix-talk\">Mailing list</a>\n      </li>\n      <li>\n        <a href=\"http://webchat.freenode.net/?channels=elixir-lang\">#elixir-lang on freenode IRC</a>\n      </li>\n      <li>\n        <a href=\"https://twitter.com/elixirphoenix\">@elixirphoenix</a>\n      </li>\n    </ul>\n  </div>\n</div>\n"]}

## Add has many relationship between topics and users

> mix ecto.gen.migration add_user_id_to_topics

	def change do
		alter table (:topics) do
			add :user_id, references(:users)
		end
	end
> mix ecto.migrate

#### get user with Topic association

iex(2)> user = Discuss.Repo.get(Discuss.User, 1)
[debug] QUERY OK source="users" db=2.1ms decode=5.2ms
SELECT u0."id", u0."email", u0."provider", u0."token", u0."inserted_at", u0."updated_at" FROM "users" AS u0 WHERE (u0."id" = $1) [1]
%Discuss.User{__meta__: #Ecto.Schema.Metadata<:loaded, "users">,
 email: "yungchih_chen@yahoo.com", id: 1,
 inserted_at: #Ecto.DateTime<2016-11-08 03:22:58>, provider: "github",
 token: "5ee2d76c309087e7c54a32c74dc56a3b54b73600",
 topics: #Ecto.Association.NotLoaded<association :topics is not loaded>,
 updated_at: #Ecto.DateTime<2016-11-08 03:22:58>}

#### add migration to add comments
> mix ecto.gen.migration add_comments