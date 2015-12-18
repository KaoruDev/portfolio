require "rails_helper"

module Projects
  class ConnectFour
    RSpec.describe Column do
      let(:column) { Column.new(0) }

      describe "#filled?" do
        it "returns false when column has space" do
          (ConnectFour::NUM_ROWS - 2).times do
            column.add_piece(1)
          end

          expect(column.filled?).to eq(false)
        end

        it "returns true when column has no more space" do
          ConnectFour::NUM_ROWS.times do
            column.add_piece(1)
          end

          expect(column.filled?).to eq(true)
        end
      end

      describe "#add_piece" do
        it "adds a piece to column" do
          column.add_piece(-1)
          expect(column.piece_at(5)).to eq(-1)
        end

        context "when filled" do
          it "will not do anything" do
            ConnectFour::NUM_ROWS.times do
              column.add_piece(1)
            end

            column.add_piece(-1)

            expect(column.piece_at(0)).to eq(1)
            expect(column.piece_at(5)).to eq(1)
          end
        end
      end

      describe "#piece_at" do
        context "when empty" do
          (0..ConnectFour::NUM_ROWS - 1 ).each do |row|
            it "returns a zero at row:#{row}" do
              expect(column.piece_at(row)).to eq(0)
            end
          end
        end

        context "when pieces added" do
          it "returns piece value" do
            column.add_piece(-1)
            column.add_piece(1)
            column.add_piece(-1)

            expect(column.piece_at(5)).to eq(-1)
            expect(column.piece_at(4)).to eq(1)
            expect(column.piece_at(3)).to eq(-1)
            expect(column.piece_at(2)).to eq(0)
          end
        end
      end
    end

  end
end

