defmodule DurationTest do
  use ExUnit.Case

  test "converts an hour" do
    assert Converter.Duration.convert("1:00:00.000") == 3600
  end

  test "converts minutes" do
    assert Converter.Duration.convert("0:30:00.000") == 1800
  end

  test "converts seconds" do
    assert Converter.Duration.convert("0:00:30.000") == 30
  end

  test "converts microseconds" do
    assert Converter.Duration.convert("0:00:00.050") == 0.05
  end

  test "converts everything" do
    assert Converter.Duration.convert("1:30:30.050") == 5430.05
  end
end
