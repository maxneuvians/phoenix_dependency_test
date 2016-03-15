defmodule PhoenixDependencyTest.Mount do
  defmacro __using__(path: path) do
    quote bind_quoted: [path: path] do
      unless String.starts_with?(path, "/"), do: path = "/" <> path
      plug PhoenixDependencyTest.Plug.Mount, path
      socket "#{path}/socket", PhoenixDependencyTest.UserSocket
    end
  end
end
