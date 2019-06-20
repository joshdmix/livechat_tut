defmodule LivechatWeb.Live.Index do
  use Phoenix.Liveview

  alias Livechat.Chat
  alias Livechat.Chat.Message

  def mount(_session, socket) do
    if connected?(socket), do: Chat.subscribe()
    {:ok, fetch(socket)}
  end

  def render(assigns) do
    LivechatWeb.ChatView.render("index.html", assigns)
  end

  def fetch(socket, user_name \\ nil) do
    assign(socket, %{
      user_name: user_name,
      messages: Chat.list_message(),
      changeset: Chat.change_message(%Message{user_name: user_name})
    })
  end

  defp get_user_name(socket) do
    socket.assigns
    |> Map.get(:user_name)
  end
end
