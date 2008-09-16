class QueueDeployer
  require 'memcache'
  require 'deployment'
  
  attr_accessor :starling

  def initialize(address, port)
    @starling = MemCache.new("#{address}:#{port}") 
    start
  end
  
  def start
    until 1 == 0
      did = @starling.get('my_queue')
      if did != nil
        @deployment = Deployment.find(did)
        @deployment.deploy_in_background!
  
        until @deployment.completed_at != nil
          puts "Waiting to complete #{did}"
          @deployment.reload
          sleep(1)
        end
      end
      puts "No Work"
      sleep(1)
    end
  end
end