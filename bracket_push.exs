defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @brackets '{}[]()'
  @bracket_dict %{?{ => ?}, ?[ => ?], ?( => ?)}

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    _match_bracket(to_charlist(str), [])
  end

  defp _match_bracket([], bracket_list), do: Enum.empty?(bracket_list)
  defp _match_bracket([h|t], bracket_list) when h in @brackets do
    cond do
      Map.has_key?(@bracket_dict, h) -> _match_bracket(t, [h] ++ bracket_list)
      Enum.empty?(bracket_list) -> false
      @bracket_dict[hd(bracket_list)] == h -> _match_bracket(t, tl(bracket_list))
      true -> false
    end
  end
  defp _match_bracket([_h|t], bracket_list), do: _match_bracket(t, bracket_list)
end
