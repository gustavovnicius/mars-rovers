defmodule Direction do
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
end
