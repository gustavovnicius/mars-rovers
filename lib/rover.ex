defmodule Rover do
  def execute_commands(%{plateau: plateau, rover: %{x: x, y: y, direction: facing, commands: commands}}) do
    Enum.reduce(
      commands,
      %{x: x, y: y, direction: facing},
      fn (command, position) ->
        Rover.move(position, plateau, command)
      end
    )
  end

  def move(position, plateau, "M") do
    Movement.walk(position, plateau)
  end

  def move(%{x: x, y: y, direction: facing}, _plateau, rotate_to) when rotate_to != "M" do
    %{x: x, y: y, direction: Movement.rotate_to(rotate_to, facing)}
  end

  def to_string(%{x: x, y: y, direction: facing}), do: "#{x} #{y} #{facing}"
end
