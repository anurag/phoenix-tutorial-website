defmodule TutorialSite.Mixfile do
  use Mix.Project

  def project do
    [app: :tutorial_site,
     version: "0.0.1",
     elixir: "~> 1.8.1",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {TutorialSite, []},
     extra_applications: [:logger, :cowboy]]
     #applications: [:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext, :phoenix_ecto, :postgrex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.4.3"},
     {:phoenix_pubsub, "~> 1.1.2"},
     {:phoenix_ecto, "~> 4.0.0"},
     {:ecto_sql, "~> 3.0"},
     {:jason, "~> 1.0"},
     {:postgrex, ">= 0.14.2"},
     {:phoenix_html, "~> 2.13.2"},
     {:phoenix_live_reload, "~> 1.2.0", only: :dev},
     {:gettext, "~> 0.16.1"},
     {:plug_cowboy, "~> 2.0"},
     {:earmark, "~> 1.3.2"}
   ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
