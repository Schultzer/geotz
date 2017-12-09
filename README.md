# Geotz

[![CircleCI](https://circleci.com/gh/Schultzer/geotz.svg?style=svg)](https://circleci.com/gh/Schultzer/geotz)

## Introduction and Getting Started

`geotz` is an elixir port of [`The Dark Sky Company, LLC`](https://github.com/darkskyapp) excellent [`tz-lookup`](https://github.com/darkskyapp/tz-lookup)
that provides functions to retrieve a timezone from a given latitude and longtitude.

## Examples

```elixir
iex> Geotz.lookup(19.432551, -99.191673)
"America/Mexico_City"

iex> Geotz.lookup("19.432551", "-99.191673")
"America/Mexico_City"
```

For help in `iex`:

```elixir
iex> h Geotz.lookup
```

## Documentation
[hex documentation for geotz](https://hexdocs.pm/geotz)

## Installation

Note that `:geotz` requires Elixir 1.5 or later.

Add `:geotz` as a dependency to your `mix` project:

```elixir
def deps do
  [
    {:geotz, "~> 0.1.0"}
  ]
end
```

## LICENSE

(The MIT License)

Copyright (c) 2017 Benjamin Schultzer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

