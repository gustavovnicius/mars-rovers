defmodule Main do
  def main(_args) do
    :stdio
    |> Parser.parse_input()
    |> Enum.map(&Rover.execute_commands/1)
    |> Enum.map(&Rover.to_string/1)
    |> Enum.each(fn(rover) -> IO.puts(rover) end)
  end
end
