defmodule PetProject.TextGenerator do
  @moduledoc "client for ai-model SamLowe/roberta-base-go_emotions"

  use GenServer

  def start_link(opts \\ []) do
    {name, opts} = opts |> Keyword.put_new(:name, __MODULE__) |> Keyword.pop!(:name)
    GenServer.start_link(__MODULE__, opts, name: name)
  end

  @impl GenServer
  def init(opts) do
    {model_base, opts} = Keyword.pop(opts, :model, {:hf, "mistralai/Mistral-7B-Instruct-v0.2"})
    stream? = !!Keyword.pop(opts, :stream, false)

    {:ok, model} = Bumblebee.load_model(model_base)
    {:ok, tokenizer} = Bumblebee.load_tokenizer(model_base)
    {:ok, generation_config} = Bumblebee.load_generation_config(model_base)

    opts = Keyword.put_new(opts, :max_new_tokens, 15)
    generation_config = Bumblebee.configure(generation_config, opts)

    serving =
      Bumblebee.Text.generation(model, tokenizer, generation_config, stream: stream?)

    {:ok, %{serving: serving}}
  end

  @impl GenServer
  def handle_call({:serve, prompt}, _from, %{serving: serving} = state) do
    {:reply, Nx.Serving.run(serving, prompt) |> Enum.to_list(), state}
  end

  def call(request, opts) do
    {callback, opts} = Keyword.pop(opts, :callback)
    {name, _opts} = Keyword.pop(opts, :name, __MODULE__)
    response = GenServer.call(name, {:serve, request}, :infinity)

    case callback do
      f when is_function(f, 1) -> f.(response)
      _ -> response
    end
  end
end
