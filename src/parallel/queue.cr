module Parallel
  class Queue(T)
    getter elems

    def initialize
      @mutex = Thread::Mutex.new
      @cond = Thread::ConditionVariable.new
      @elems = [] of T
    end

    def initialize(@elems : T)
      @mutex = Thread::Mutex.new
      @cond = Thread::ConditionVariable.new
    end

    def <<(item)
      @mutex.synchronize do
        @elems << item
        @cond.signal
      end
    end

    def pop
      @mutex.synchronize do
        while true
          if @elems.empty?
            @cond.wait @mutex
          else
            return @elems.shift
          end
        end
      end
    end

    def size
      @elems.size
    end
  end
end