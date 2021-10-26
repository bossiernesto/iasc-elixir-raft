defmodule IASC.Telemetry.Instrumenter do
  require Logger

  def setup do
    events = [
      [:node, :event, :up],
      [:node, :event, :down]
    ]
    :telemetry.attach_many("iasc-instrumenter", events, &handle_event/4, nil)
  end

  def handle_event([:node, :event, :up], measurements, metadata, _config) do
    Logger.debug("---- Node up: #{measurements.node_affected} ----")
  end

  def handle_event([:node, :event, :down], measurements, metadata, _config) do
    Logger.warn("---- Node down: #{measurements.node_affected} ----")
  end
end