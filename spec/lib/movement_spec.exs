defmodule MovementSpec do
  use ESpec

  context "rotating" do
    context "to the left" do
      it "should face East" do
        expect Movement.rotate_to("L", "N") |> to(eq "W")
      end

      it "should face South" do
        expect Movement.rotate_to("L", "W") |> to(eq "S")
      end

      it "should face West" do
        expect Movement.rotate_to("L", "S") |> to(eq "E")
      end

      it "should face North" do
        expect Movement.rotate_to("L", "E") |> to(eq "N")
      end
    end

    context "to the right" do
      it "should face East" do
        expect Movement.rotate_to("R", "N") |> to(eq "E")
      end

      it "should face South" do
        expect Movement.rotate_to("R", "E") |> to(eq "S")
      end

      it "should face West" do
        expect Movement.rotate_to("R", "S") |> to(eq "W")
      end

      it "should face North" do
        expect Movement.rotate_to("R", "W") |> to(eq "N")
      end
    end

    context "walking" do
      let :x, do: 3
      let :y, do: 3

      context "when facing north" do
        let :direction, do: "N"

        it "should increment y" do
          expected = %{x: x, y: y + 1, direction: direction}
          expect(Movement.walk(%{x: x, y: y, direction: direction})) |> to(eq expected)
        end
      end

      context "when facing west" do
        let :direction, do: "W"

        it "should decrement x" do
          expected = %{x: x - 1, y: y, direction: direction}
          expect(Movement.walk(%{x: x, y: y, direction: direction})) |> to(eq expected)
        end
      end

      context "when facing south" do
        let :direction, do: "S"

        it "should decrement y" do
          expected = %{x: x, y: y - 1, direction: direction}
          expect(Movement.walk(%{x: x, y: y, direction: direction})) |> to(eq expected)
        end
      end

      context "when facing east" do
        let :direction, do: "E"

        it "should increment x" do
          expected = %{x: x + 1, y: y, direction: direction}
          expect(Movement.walk(%{x: x, y: y, direction: direction})) |> to(eq expected)
        end
      end
    end
  end
end
