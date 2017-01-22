defmodule Rover do
  def move(position, plateau, "M") do
    Movement.walk(position, plateau)
  end

  def move(%{x: x, y: y, direction: facing}, _plateau, rotate_to) when rotate_to != "M" do
    %{x: x, y: y, direction: Movement.rotate_to(rotate_to, facing)}
  end

  def to_string(%{x: x, y: y, direction: facing}), do: "#{x} #{y} #{facing}"
end
