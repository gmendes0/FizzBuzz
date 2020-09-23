defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, return list" do
      expected_response =
        {:ok, [1, 2, :fizz, 4, :buzz, :fizz, 11, :fizzbuzz, :fizz, :buzz, 41, :fizz, 43]}

      assert FizzBuzz.build("numbers.txt") == expected_response
    end

    test "when a invalid file is provided, return an error" do
      expected_response = {:error, "Error to read file: enoent"}
      assert FizzBuzz.build("number.txt") == expected_response
    end
  end
end
