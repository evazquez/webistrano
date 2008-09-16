class QueueManager
  require 'memcache'
 
  attr_accessor :starling

  def initialize(address, port)
    @starling = MemCache.new("#{address}:#{port}") 
  end

  def push(item)
    @starling.set('my_queue', item)
  end

end
