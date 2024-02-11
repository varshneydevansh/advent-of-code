defmodule Day2 do
  def run do
    file_path = Path.expand("./day2_input.txt")

    total_red   = 12
    total_green = 13
    total_blue  = 14

    valid_game_ids =
      File.stream!(file_path)
      |> Enum.reduce([], fn line, acc ->
        [game_number_str, colors_str] =
          case Regex.run(~r/Game (\d+): (.+)/, line) do
            [_, game_number, colors] -> [game_number, colors]
            _ -> nil
          end

        case {String.to_integer(game_number_str), colors_str} do
          {game_number, colors_str} ->
            color_list = colors_str
                          |> String.split("; ")
                          |> Enum.map(fn color_str ->
                            color_str
                            |> String.split(", ")
                            |> Enum.all?(fn count_color ->
                              [nos_cube_str, color] = String.split(count_color, " ")
                              nos_cube = String.to_integer(nos_cube_str)
                              case color do
                                "red"   -> nos_cube <= total_red
                                "green" -> nos_cube <= total_green
                                "blue"  -> nos_cube <= total_blue
                              end
                            end)
                          end)

            if Enum.all?(color_list, &(&1)) do
              IO.puts("Game Number: #{game_number}") # Debug print
              [game_number | acc]
            else
              acc
            end
          _ ->
            IO.puts("Invalid line format: #{line}")
            acc
        end
      end)

    sum_of_valid_game_ids = Enum.sum(valid_game_ids)

    IO.puts("Sum of Valid Game IDs: #{sum_of_valid_game_ids}")
  end
end

Day2.run()
