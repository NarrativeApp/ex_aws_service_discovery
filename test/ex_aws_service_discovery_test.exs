defmodule ExAws.ServiceDiscoveryTest do
  use ExUnit.Case
  doctest ExAws.ServiceDiscovery

  test "greets the world" do
    assert ExAws.ServiceDiscovery.hello() == :world
  end
end
