defmodule Geotz do
  @moduledoc """
  Provides functions for fast timezone lookup for a given latitude and longtitude
  """

  alias Geotz.Data

  @tzdata Data.tz_data()
  @tzlist Data.tz_list()
  @tzlength length(Data.tz_list())

  @doc """
  Get a timezone from a given latitude and longtitude.

  ## Examples

      iex> Geotz.lookup(19.432551, -99.191673)
      "America/Mexico_City"

      iex> Geotz.lookup("19.432551", "-99.191673")
      "America/Mexico_City"

      iex> Geotz.lookup("19.432551", -99.191673)
      "America/Mexico_City"

      iex> Geotz.lookup(Decimal.new(19.432551), Decimal.new(-99.191673))
      "America/Mexico_City"
  """
  @spec lookup(float | String.t | Decimal.t, float | String.t | Decimal.t) :: String.t
  if Code.ensure_compiled?(Decimal) do
    def lookup(%Decimal{} = lat, %Decimal{} = lng) do
      lat |> Decimal.to_float() |> lookup(Decimal.to_float(lng))
    end
  end

  def lookup(<<lat::binary>>, lng), do: lat |> String.to_float() |> lookup(lng)
  def lookup(lat, <<lng::binary>>), do: lat |> lookup(String.to_float(lng))

  def lookup(lat, lng) do
    n = -1
    x = (180.0 + lng) * 48 / 360.00000000000006
    y = ( 90.0 - lat) * 24 / 180.00000000000003

    u = x |> Float.floor |> round
    v = y |> Float.floor |> round

    i = v * 96 + u * 2
    ia = String.at(@tzdata, i)
    ib = String.at(@tzdata, i + 1)
    <<a, _>> = <<ia::binary, 0>>
    <<b, _>> = <<ib::binary, 0>>
    i = a * 56 + b - 1995

    find(i, n, x, y, u, v)
  end
  defp find(i, n, x, y, u, v) when i + @tzlength < 3136 do
    n = n + i + 1
    x = :math.fmod((x - u) * 2, 2)
    y = :math.fmod((y - v) * 2, 2)
    u = x |> Float.floor |> round
    v = y |> Float.floor |> round

    i = n * 8 + v * 4 + u * 2 + 2304
    ia = String.at(@tzdata, i)
    ib = String.at(@tzdata, i + 1)
    <<a, _>> = <<ia::binary, 0>>
    <<b, _>> = <<ib::binary, 0>>
    i = a * 56 + b - 1995
    find(i, n, x, y, u, v)
  end

  defp find(i, _n, _x, _y, _u, _v), do: Enum.at(@tzlist, i + @tzlength - 3136)
end
