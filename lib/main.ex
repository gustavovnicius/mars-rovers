defmodule Main do
  def main(_args) do
    Parser.parse_input(:stdio)
    |> Enum.map(
      fn(%{plateau: plateau, rover: %{x: x, y: y, direction: facing, commands: commands}}) ->
        Enum.reduce(
          commands,
          %{x: x, y: y, direction: facing},
          fn (command, position) ->
            Rover.move(position, plateau, command)
          end
        )
      end
    )
    |> Enum.map(fn(%{x: x, y: y, direction: facing}) -> "#{x} #{y} #{facing}" end)
    |> Enum.each(fn(rover) -> IO.puts(rover) end)
  end
end
