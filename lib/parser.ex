defmodule Parser do
  def parse_input(from) do
    %{plateau: read_plateau(from), rovers: read_rovers(from)}
  end

  def read_plateau(from) do
    case IO.read(from, :line) do
      :eof -> raise "No data was found"
      raw_plateau -> raw_plateau |> parse_plateau()
    end
  end

  def parse_plateau(raw_plateau) do
    [x, y] = String.trim(raw_plateau) |> String.split(" ")

    %{x: String.to_integer(x), y: String.to_integer(y)}
  end

  def read_rovers(from) do
    IO.stream(from, :line)
    |> Enum.chunk(2)
    |> Enum.reduce([], fn(raw_rover, acc) -> [parse_rover(raw_rover) | acc] end)
    |> Enum.reverse
  end

  def parse_rover([position, commands]) do
    Map.merge(parse_rover_position(position), parse_rover_commands(commands))
  end

  def parse_rover_position(raw_position) do
    [x, y, facing] = String.trim(raw_position) |> String.split(" ")

    %{x: String.to_integer(x), y: String.to_integer(y), direction: facing}
  end

  def parse_rover_commands(raw_commands) do
    %{commands: String.split(String.trim(raw_commands), "", trim: true)}
  end
end
