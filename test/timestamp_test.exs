defmodule Converter.TimestampTest do
  use ExUnit.Case

  def sample do
    "4/1/11 11:00:00 AM"
  end

  def samples do
    [
      "4/1/11 11:00:00 AM",
      "3/12/14 12:00:00 AM",
      "2/29/16 12:11:11 PM",
      "1/1/11 12:00:01 AM",
      "12/31/16 11:59:59 PM",
      "11/11/11 11:11:11 AM",
      "5/12/10 4:48:12 PM",
      "10/5/12 10:31:11 PM",
      "10/2/04 8:44:11 AM"
    ]
  end

  test "converts to DateTime in Pacific TZ" do
    assert Converter.Timestamp.to_iso(sample()) == "20110401T110000-0700"
  end

  test "converts to Eastern TZ" do
    assert Converter.Timestamp.to_eastern(sample()) == "20110401T140000-0400"
  end

  test "rolls over midnight correctly" do
    sample = "10/5/12 10:31:11 PM"
    assert Converter.Timestamp.to_eastern(sample) == "20121006T013111-0400"
  end

  test "rolls over year end correctly" do
    sample = "12/31/16 11:59:59 PM"
    assert Converter.Timestamp.to_eastern(sample) == "20170101T025959-0500"
  end
end
