defmodule Rover do
  def move(position, plateau, "M") do
    Movement.walk(position, plateau)
  end

  def move(%{x: x, y: y, direction: facing}, _plateau, rotate_to) when rotate_to != "M" do
    %{x: x, y: y, facing: Movement.rotate_to(rotate_to, facing)}
  end
end
