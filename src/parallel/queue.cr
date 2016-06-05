class Queue(T)
  def initialize
    @mutex = Thread::Mutex.new
    @cond = Thread::ConditionVariable.new
    @elems = [] of T
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
          @elems.pop
        end
      end
    end
  end

  def size
    @elems.size
  end
end
