defmodule Moves do

   def set([ _ | tail ]) do
    String.split(Enum.at(tail, 0), "", trim: true)
  end
end 
