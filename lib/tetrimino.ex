defmodule Tetrimino do

  @enforce_keys [:matrix, :pos, :type]
  defstruct [:matrix, :pos, :type]

  def createType(type, pos) do
    cond do
      type == 1 ->
        typeOne(pos)
      type == 2 ->
        typeTwo(pos)
      type == 3 ->
        typeThree(pos)
      type == 4 ->
        typeFour(pos)
      type == 5 ->
        typeFive(pos)
      type == 6 ->
        typeSix(pos)
      type == 7 ->
        typeSeven(pos)
    end
  end

  def typeOne(pos) do
    %Tetrimino{matrix: [[0, 0], [1, 0], [0, 1], [1, 1]], pos: pos, type: "y"}
  end

  def typeTwo(pos) do
    %Tetrimino{matrix: [[-1, 1], [0, 1], [0, 0], [1, 0]], pos: pos, type: "r"}
  end

  def typeThree(pos) do
    %Tetrimino{matrix: [[-1, 0], [0, 0], [0, 1], [1, 1]], pos: pos, type: "g"}
  end

  def typeFour(pos) do
    %Tetrimino{matrix: [[-1, 1], [-1, 0], [0, 0], [1, 0]], pos: pos, type: "b"}
  end

  def typeFive(pos) do
    %Tetrimino{matrix: [[-1, 0], [0, 0], [1, 0], [1, 1]], pos: pos, type: "o"}
  end

  def typeSix(pos) do
    %Tetrimino{matrix: [[-1, 0], [0, 0], [1, 0], [0, 1]], pos: pos, type: "p"}
  end

  def typeSeven(pos) do
    %Tetrimino{matrix: [[-1, 0], [0, 0], [1, 0], [2, 0]], pos: pos, type: "c"}
  end

  def leftRotMatrix() do
    [[0, 1], [-1, 0]]
  end

  def rightRotMatrix() do
    [[0, -1], [1, 0]]
  end

  def rotate(tetrimino, rotMatrix) do
    rotatedMatrix = Matrix.multiply(rotMatrix, tetrimino.matrix)
    %{tetrimino | matrix: rotatedMatrix}
  end

  # Returns a matrix containing the position of each part of the tetrimino on the board
  def getPosOnBoard(%Tetrimino{matrix: matrix, pos: {xPos, yPos}, type: _}) do
    Enum.map(matrix, &([Enum.at(&1, 0) + xPos, Enum.at(&1, 1) + yPos]))
  end

  # Returns the X values of the tetrimino on the board
  def getXValues(tetrimino) do
    pos = getPosOnBoard(tetrimino)
    Enum.flat_map(pos, &([Enum.at(&1, 0)]))
  end

  # Returns the Y values of the tetrimino on the board
  def getYValues(tetrimino) do
    pos = getPosOnBoard(tetrimino)
    Enum.flat_map(pos, &([Enum.at(&1, 1)]))
  end
end
