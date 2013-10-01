# TODO (JW):
# 1. Create a new project (not rails) for this 'daemon'.
# 2. Google "how to write daemon ruby" for best practices.
# 3. Create a Gemfile for bundler for your daemon project.
# 4. Use good file organization as in phase 1 ... folders, etc.
# 5. Break any assumptions you made in your modules that you're
#    in a Rails app.



#!/usr/bin/env ruby

require 'multi_json'
require 'net/http'
require_relative 'lamp_requests'

class LampController
  include LampRequests

  def initialize
    @stopped = false
  end
  
  def run
    until @stopped
      begin
        # issue request to server (deployed on Heroku) for commands
        # parse JSON 
        # issue commands to bridge
        toggle_on_off
        sleep 5
      rescue SystemExit, Interrupt
        @stopped = true
      end
    end
  end

end

lc = LampController.new
lc.run()
