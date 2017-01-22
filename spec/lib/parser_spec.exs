defmodule ParserSpec do
  use ESpec

  let plateau: %{x: 5, y: 4}

  context "parsing plateau info" do
    let raw_plateau: "5 4\n"

    it "should read raw_plateau from input" do
      allow(IO).to accept(:read, fn(_input, :line) -> raw_plateau end)

      expect(Parser.read_plateau(:stdio)) |> to(eq plateau)
    end

    it "should return failure if :eof is found" do
      allow(IO).to accept(:read, fn(_input, :line) -> :eof end)

      expect(fn() -> Parser.read_plateau(:stdio) end) |> to(raise_exception())
    end

    it "should parse plateau" do
      expect(Parser.parse_plateau(raw_plateau)) |> to(eq plateau)
    end
  end

  context "parsing rovers info" do
    let raw_rover_1: ["1 2 N\n", "LMLMLMLMM\n"]
    let raw_rover_2: ["3 3 E\n", "MMRMMRMRRM\n"]
    let raw_rover_incomplete: ["3 3 W"]

    let rover_1: %{x: 1, y: 2, direction: "N", commands: ~w(L M L M L M L M M)}
    let rover_2: %{x: 3, y: 3, direction: "E", commands: ~w(M M R M M R M R R M)}
    let rovers: [rover_1, rover_2]

    it "should read from input" do
      allow(IO).to accept(:stream, fn(_input, :line) -> raw_rover_1 ++ raw_rover_2 end)

      expect(Parser.read_rovers(:stdio)) |> to(eq rovers)
    end

    it "should ignore incomplete rover data" do
      allow(IO).to accept(:stream, fn(_input, :line) -> raw_rover_1 ++ raw_rover_2 ++ raw_rover_incomplete end)

      expect(Parser.read_rovers(:stdio)) |> to(eq rovers)
    end

    it "should parse rover position" do
      expected = %{x: 1, y: 1, direction: "N"}

      expect(Parser.parse_rover_position("1 1 N\n")) |> to(eq expected)
    end

    it "should parse rover commands" do
      expected = %{commands: ~w(L M L M L M L M M)}

      expect(Parser.parse_rover_commands("LMLMLMLMM\n")) |> to(eq expected)
    end

    it "should join rover and plateau data" do
      expected = [%{rover: rover_1, plateau: plateau}, %{rover: rover_2, plateau: plateau}]

      expect(Parser.denormalize_plateau_and_rovers_data(plateau, [rover_1, rover_2])) |> to(eq(expected))
    end
  end
end
