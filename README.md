# PhoenixDependencyTest

To start your Phoenix app:

  1. Install dependencies with `mix deps.get`
  2. Start Phoenix endpoint with `mix phoenix.server`

## Using this app as a dependency

To use this app as a dependency in another application you need to include it
in your dependencies inside `mix.exs`:

```
# Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.1.1"},
     {:phoenix_html, "~> 2.3"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.9"},
     {:cowboy, "~> 1.0"},
     {:phoenix_dependency_test, github: "maxneuvians/phoenix_dependency_test"}]
  end
```

and also start it as part of your application:

```
def application do
  [mod: {Main, []},
   applications: [:phoenix, :phoenix_html, :cowboy, :logger, :gettext, :phoenix_dependency_test]]
end
```

The last thing you need to do is include `use PhoenixDependencyTest.Mount, path: "/test"`
at the top of your `lib/my_app/endpoint.ex`:

```
defmodule MyApp.Endpoint do
  use Phoenix.Endpoint, otp_app: :main
  use PhoenixDependencyTest.Mount, path: "/test"
```

where you can replace the `path` with an arbitrary mount point.
