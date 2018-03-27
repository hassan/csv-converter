defmodule Converter.Duration do
  def convert(string) do
    [hours, minutes, seconds] = String.split(string, ":")

    hours_to_seconds(hours) + minutes_to_seconds(minutes) + seconds(seconds)
  end

  def hours_to_seconds(string) do
    String.to_integer(string) * 3600
  end

  def minutes_to_seconds(string) do
    String.to_integer(string) * 60
  end

  def seconds(string) do
    String.to_float(string)
  end
end
