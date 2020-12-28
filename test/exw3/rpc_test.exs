defmodule ExW3.RpcTest do
  use ExUnit.Case

  describe ".accounts" do
    test "returns a list from the eth_accounts JSON-RPC endpoint" do
      assert ExW3.accounts() |> is_list
    end

    test "can override the http endpoint" do
      assert ExW3.accounts(url: Ethereumex.Config.rpc_url()) |> is_list
      assert ExW3.accounts(url: "https://localhost:1234") == {:error, :econnrefused}
    end
  end

  describe ".block_number" do
    test "returns the integer block number from the eth_blockNumber JSON-RPC endpoint" do
      assert ExW3.block_number() |> is_integer
    end

    test "can override the http endpoint" do
      assert ExW3.block_number(url: Ethereumex.Config.rpc_url()) |> is_integer
      assert ExW3.block_number(url: "https://localhost:1234") == {:error, :econnrefused}
    end
  end
end
