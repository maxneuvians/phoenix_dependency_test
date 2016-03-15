defmodule PhoenixDependencyTest.PageController do
  use PhoenixDependencyTest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
