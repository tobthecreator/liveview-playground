defmodule PlaygroundWeb.TestController do
  use PlaygroundWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
