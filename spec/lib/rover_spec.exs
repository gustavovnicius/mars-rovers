defmodule RoverSpec do
  use ESpec

  context "walking" do
    let position: %{}, plateau: %{}

    it "should walk" do
      allow(Movement).to accept(:walk, fn(_, _) -> nil end)

      Rover.move(position, plateau, "M")

      expect(Movement) |> to(accepted(:walk, [position, plateau]))
    end

    context "rotating" do
      let facing_north: "N", rotate_to_left: "L"
      let position: %{x: 0, y: 0, direction: facing_north}, plateau: %{}

      it "should rotate" do
        allow(Movement).to accept(:rotate_to, fn(_, _) -> nil end)

        Rover.move(position, plateau, rotate_to_left)

        expect(Movement) |> to(accepted(:rotate_to, [rotate_to_left, facing_north]))
      end
    end
  end
end
