defmodule Converter.Assembler do
  alias Converter.Timestamp
  alias Converter.Duration
  require NimbleCSV

  def parse(fields) do
    case List.first(fields) do
      "Timestamp" -> fields
      _ -> process(fields)
    end
  end

  def process(fields) do
    [
      timestamp,
      address,
      zip,
      fullname,
      foo_duration,
      bar_duration,
      _total_duration,
      notes
    ] = fields

    Keyword.new([
      {:timestamp, Timestamp.to_eastern(timestamp)},
      {:address, address},
      {:zip, String.pad_leading(zip, 5, "0")},
      {:fullname, String.upcase(fullname)},
      {:foo_duration, Duration.convert(foo_duration)},
      {:bar_duration, Duration.convert(bar_duration)},
      {:total_duration, Duration.convert(foo_duration) + Duration.convert(bar_duration)},
      {:notes, notes}
    ])
    |> Keyword.values()
  end
end
