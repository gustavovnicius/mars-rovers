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
  end
end
