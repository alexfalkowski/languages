defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, registry} = KV.Registry.start_link([])
    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert KV.Registry.lookup(registry, "shopping") == :error

    KV.Registry.create(registry, "shopping")
    assert {:ok, shopping} = KV.Registry.lookup(registry, "shopping")

    KV.Bucket.put(shopping, "milk", 1)
    assert KV.Bucket.get(shopping, "milk") == 1
  end

  test "removes buckets on exit", %{registry: registry} do
    KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)
    assert KV.Registry.lookup(registry, "shopping") == :error
  end

  test "removes bucket on crash", %{registry: registry} do
    KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")

    # Stop the bucket with non-normal reason
    Agent.stop(bucket, :shutdown)
    assert KV.Registry.lookup(registry, "shopping") == :error
  end
end
