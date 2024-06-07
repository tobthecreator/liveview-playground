defmodule PlaygroundWeb.CounterLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 0)}
  end

  def render(assigns) do
    ~L"""
    <div id="counter-container">
      <h1 id="counter-text">Counter: <%= @count %></h1>
      <button phx-click="increment">+</button>
      <button phx-click="decrement">-</button>
      <button id="bold-button" phx-hook="BoldToggle">Bold</button>
    </div>
    """
  end

  def handle_event("increment", _value, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("decrement", _value, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end

  # def handle_event("BoldToggle")
end
