defmodule Converter.Timestamp do
  def to_iso(timestamp) do
    timestamp
    |> Timex.parse!(parse_format())
    |> Timex.to_datetime("America/Los_Angeles")
    |> DateTime.to_iso8601(:basic)
  end

  def to_eastern(timestamp) do
    timestamp
    |> Timex.parse!(parse_format())
    |> Timex.to_datetime("America/Los_Angeles")
    |> Timex.Timezone.convert("America/New_York")
    |> DateTime.to_iso8601(:basic)
  end

  defp parse_format do
    "{M}/{D}/{YY} {h12}:{m}:{s} {AM}"
  end
end
