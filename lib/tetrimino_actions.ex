defmodule TetriminoActions do

  def performMove(board, tetrimino, move) do
    cond do
      move == "l" || move == "r" ->
        shiftHorizontally(board, tetrimino, move)
      move == "L"|| move == "R" ->
        rotate(board, tetrimino, move)
      move == "." -> shiftDown(board, tetrimino)
      move == "+" -> performDrop(board, tetrimino)
    end
  end

  # Shifts a tetrimino one block to the left or right.
  def shiftHorizontally(board, tetrimino, direction) do
    {x, y} = tetrimino.pos
    shiftConstant = if direction == "l", do: -1, else: 1
    shiftedTetrimino = %{tetrimino | pos: {x + shiftConstant, y}}

    if overlaps?(board, shiftedTetrimino) do
      {board, tetrimino, :failed}
    else
      {board, shiftedTetrimino, :ok}
    end
  end

  # Shifts a tetrimino one block down.
  def shiftDown(board, tetrimino) do
    if onBottom?(board, tetrimino) do
      {board, tetrimino, :failed}
    else
      {x, y} = tetrimino.pos
      shiftedTetrimino = %{tetrimino | pos: {x, y + 1}}

      if overlaps?(board, shiftedTetrimino) do
        {board, tetrimino, :failed}
      else
        {board, shiftedTetrimino, :ok}
      end
    end
  end

  # Continuously shifts a tetrimino down until it hits another
  # tetrimino or the bottom of the board.
  def performDrop(board, tetrimino) do
    {newBoard, newTetrimino, status} = shiftDown(board, tetrimino)
    if status == :ok do
      performDrop(newBoard, newTetrimino)
    else
      {newBoard, newTetrimino}
    end
  end

  # Checks if the current tetrimino is at the bottom of the board, or on top of another piece.
  def onBottom?(board, tetrimino) do
    bottomRow = Board.getNumRows(board)
    Tetrimino.getYValues(tetrimino)
    |> Enum.member?(bottomRow)
  end

  # Rotates a tetrimino in the given direction.
  def rotate(board, tetrimino, direction) do
    rotMatrix =
      cond do
        direction == "L" -> Tetrimino.leftRotMatrix()
        true -> Tetrimino.rightRotMatrix()
      end

    rotatedTetrimino = Tetrimino.rotate(tetrimino, rotMatrix)
    if overlaps?(board, rotatedTetrimino) do
      {board, tetrimino, :failed}
    else
      {board, rotatedTetrimino, :ok}
    end
  end

  # Checks if the another tetrimino exists at the positions
  # of the given tetrimino. Used to check for collisions.
  def overlaps?(board, tetrimino) do
    positions = Tetrimino.getPosOnBoard(tetrimino)
    Board.blockAtPositions?(board, positions)
  end 

end

