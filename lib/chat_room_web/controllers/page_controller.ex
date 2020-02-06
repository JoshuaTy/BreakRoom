defmodule ChatRoomWeb.PageController do
  use ChatRoomWeb, :controller

  alias ChatRoom.Chats


  def index(conn, _params) do
    messages = Chats.list_messages()
    render(conn, "index.html", messages: messages)
  end
end
