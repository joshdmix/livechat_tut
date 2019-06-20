defmodule LivechatWeb.ChatController do
  use LivechatWeb, :controller

  def index(conn, _params) do
    Phoenix.Liveview.Controller.live_render(
      conn,
      LivechatWeb.Live.Index,
      session: %{}
    )
  end
end
