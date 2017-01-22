defmodule Movement do
  @facing_north "N"
  @facing_west "W"
  @facing_south "S"
  @facing_east "E"

  @left "L"
  @right "R"
  @forward "M"

  def rotate_to(@left, facing),  do: rotate_to_left(facing)
  def rotate_to(@right, facing), do: rotate_to_right(facing)

  def rotate_to_left(@facing_north), do: @facing_west
  def rotate_to_left(@facing_west),  do: @facing_south
  def rotate_to_left(@facing_south), do: @facing_east
  def rotate_to_left(@facing_east),  do: @facing_north

  def rotate_to_right(@facing_north), do: @facing_east
  def rotate_to_right(@facing_east),  do: @facing_south
  def rotate_to_right(@facing_south), do: @facing_west
  def rotate_to_right(@facing_west),  do: @facing_north

  def walk(%{x: x, y: y, direction: @facing_north}, %{y: upper_y}) when upper_y < y + 1 do
    %{x: x, y: y, direction: @facing_north}
  end

  def walk(%{x: x, y: y, direction: @facing_north}, _) do
    %{x: x, y: y + 1, direction: @facing_north}
  end

  def walk(%{x: x, y: y, direction: @facing_west}, _) when x - 1 < 0 do
    %{x: x, y: y, direction: @facing_west}
  end

  def walk(%{x: x, y: y, direction: @facing_west}, _) do
    %{x: x - 1, y: y, direction: @facing_west}
  end

  def walk(%{x: x, y: y, direction: @facing_south}, _) when y - 1 < 0 do
    %{x: x, y: y, direction: @facing_south}
  end

  def walk(%{x: x, y: y, direction: @facing_south}, _) do
    %{x: x, y: y - 1, direction: @facing_south}
  end

  def walk(%{x: x, y: y, direction: @facing_east}, %{x: upper_x}) when upper_x < x + 1 do
    %{x: x, y: y, direction: @facing_east}
  end

  def walk(%{x: x, y: y, direction: @facing_east}, _) do
    %{x: x + 1, y: y, direction: @facing_east}
  end
end
