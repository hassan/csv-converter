defmodule Converter.Input do
  require Timex
  require IEx

  def main(_args) do
    IO.read(:stdio, :all)
    |> clean()
    |> process()
    |> IO.binwrite()
  end

  def clean(input) do
    input
    |> String.graphemes()
    |> Enum.map(fn x -> if(String.valid?(x), do: x, else: String.replace(x, x, "\uFFFD")) end)
    |> Enum.join("")
  end

  def process(input) do
    input
    |> NimbleCSV.RFC4180.parse_string(headers: false)
    |> Enum.map(fn x -> Converter.Assembler.parse(x) end)
    |> NimbleCSV.RFC4180.dump_to_iodata()
  end
end
