defmodule HelloWorld.Mixfile do
  use Mix.Project

  def project do
    [deps: deps()]
  end

  defp deps do
    [
      {:credo, "~>0.7", only: [:dev, :test]}
    ]
  end
end
