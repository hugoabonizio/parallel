module Parallel
  def self.processor_count
    value = if File.readable?("/proc/cpuinfo")
              File.read_lines("/proc/cpuinfo").join.scan(/processor/).size
            else
              1
            end
  end
end

puts Parallel.processor_count
