module Retryable
  TriesExceededError = Class.new(StandardError) do
    attr_reader :original_error

    def initialize(message, original_error)
      super(message)
      @original_error = original_error
    end
  end

  def retryable(tries: 3, retry_on: StandardError)
    retry_on = Array(retry_on)
    try_counter = 0

    begin
      try_counter += 1

      yield
    rescue *retry_on => error
      try_counter <= tries ? retry : raise(error)

      raise(TriesExceededError, 'Retry attempts exceeded', error)
    end
  end
end
