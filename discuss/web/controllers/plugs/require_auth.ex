defmodule Discuss.Plugs.RequireAuth do
	import Plug.Conn
	import Phoenix.Controller

	alias Discuss.Router.Helpers

	def init(_params) do
		
	end

	# this _params is whatever return from init() method
	def call(conn, _params) do
		if conn.assigns[:user] do
			conn
		else
			conn
			|> put_flash(:error, "You must be login")
			|> redirect(to: Helpers.topic_path(conn, :index))
			|> halt()
		end

	end

end