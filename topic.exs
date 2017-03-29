defmodule DataStore do
	
	def create(topic, %{"admin" => true} = user) do
		IO.puts "Starting create method 1"
		do_create
	end

	def create(topic, %{"admin" => false, "topics_count" => 0} = user) do
		IO.puts "Starting create method 2"
		request_admin_approval
	end

	def create(topic, %{"admin" => false} = user) do
		IO.puts "Starting create method 3"
		do_create
		notify_admin
	end		

	defp do_create do
		IO.puts "do_create_topic"
	end

	defp notify_admin do
		IO.puts "notify_admin"
	end

	defp request_admin_approval do
		IO.puts "request_admin_approval"
	end

end

topic = "Topic Title"

admin = %{"admin" => true}

DataStore.create(topic, admin)

new_user = %{"admin" => false, "topics_count" => 0}
DataStore.create(topic, new_user)

old_user = %{"admin" => false, "topics_count" => 1}
DataStore.create(topic, old_user)
