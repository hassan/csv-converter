defmodule Converter.MixProject do
  use Mix.Project

  def project do
    [
      app: :converter,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      escript: [main_module: Converter.Input],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:nimble_csv, "~> 0.4"},
      {:tzdata, "~> 0.1.8"},
      {:timex, "~> 3.2"}
    ]
  end
end
