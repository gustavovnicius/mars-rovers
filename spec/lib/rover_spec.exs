defmodule RoverSpec do
  use ESpec

  let rover: %{x: 1, y: 2, direction: "N", commands: ~w(L M L M L M L M M)}

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

  context "transforming" do
    it "should convert rover into desired output" do
      expect(Rover.to_string(rover)) |> to(eq "1 2 N")
    end
  end

  context "executing commands" do
    let plateau: %{x: 5, y: 5}
    let input: %{plateau: plateau, rover: rover}

    it "should execute rover commands" do
      expected = %{x: 1, y: 3, direction: "N"}

      expect(Rover.execute_commands(input)) |> to(eq expected)
    end
  end
end
