defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @regex_pattern ~r/(_|[^\w\p{Pd}])+/u

  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(@regex_pattern, trim: true)
    |> Enum.reduce(Map.new, &update_count/2)
  end

  defp update_count(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end
end
