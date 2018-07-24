defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    registry = start_supervised!(KV.Registry)
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert KV.Registry.lookup(registry, "shopping") == :error

    KV.Registry.create(registry, "shopping")
    assert {:ok, shopping} = KV.Registry.lookup(registry, "shopping")

    KV.Bucket.put(shopping, "milk", 1)
    assert KV.Bucket.get(shopping, "milk") == 1
  end
end
