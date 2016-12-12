class Parallel
  macro each(elements, &block)
    pids = [] of Process
    pipes = [] of Array(IO::FileDescriptor)

    def _perform({{ block.args.map(&.id).join(",").id }})
      {{ block.body }}
    end

    3.times do
      reader, writer = IO.pipe
      response_reader, response_writer = IO.pipe
      pipes << [reader, writer, response_reader, response_writer]
      pids << fork do
        loop do
          message = reader.gets
          break if message == 'z'
          _perform(message)
          response_writer.puts ""
        end
      end
    end

    # sleep 0.01
    {% for elem in elements %}
      waiters = IO.select(nil, pipes.map { |p| p[1] })
      if waiters
        waiters.sample.puts {{ elem }}
      end
    {% end %}

    {% for elem in elements %}
      waiters = IO.select(pipes.map { |p| p[2] })
      if waiters
        waiters.first.gets
      end
    {% end %}

    pids.each do |pid|
      Process.kill Signal::KILL, pid.pid
    end
  end
end
