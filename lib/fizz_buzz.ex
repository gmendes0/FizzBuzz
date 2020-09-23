defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    list = result
    |> String.split(",")
    |> Enum.map(&convert_and_evaluate_numbers/1)
    {:ok, list}
  end

  defp handle_file_read({:error, error}) do
    {:error, "Error to read file: #{error}"}
  end

  defp convert_and_evaluate_numbers(element) do
    element
    |> String.trim()
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 5) == 0 and rem(number, 3) == 0, do: :fizzbuzz

  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz

  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz

  defp evaluate_number(number), do: number
end
