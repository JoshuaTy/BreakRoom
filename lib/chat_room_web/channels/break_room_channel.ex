defmodule ChatRoomWeb.BreakRoomChannel do
  use ChatRoomWeb, :channel

  alias ChatRoom.Chats

  def join("break_room:lobby", _payload, socket) do
   
    {:ok, socket}
   
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (break_room:lobby).
  def handle_in("new_message", payload, socket) do
    Chats.create_message(payload)
    broadcast! socket, "new_message", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
 
end
