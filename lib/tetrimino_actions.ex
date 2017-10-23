defmodule TetriminoActions do
  
  def performDrop(board, tetrimino) do

  end

  # Checks if the current tetrimino is at the bottom of the board, or on top of another piece.
  def isOnBottom(board, tetrimino) do
    tetriminoPositions = Tetrimino.getPosOnBoard(tetrimino)
      cond do
        Tetrimino.getYValues(tetrimino)
        |> Enum.member?(1) -> true

      end
  end

end
