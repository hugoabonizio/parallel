module Parallel
  class Channel(T)
    @reader : IO::FileDescriptor
    @writer : IO::FileDescriptor

    def initialize
      @reader, @writer = IO.pipe
    end

    def send(data : T)
      @writer.puts data
    end

    def receive
      @reader.gets
    end
  end
end
