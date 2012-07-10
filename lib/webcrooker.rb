require 'webcrooker/version'
require 'webcrooker/crooker'

module Webcrooker
  class << self
    def new(url)
      Crooker.new(url)
    end
  end
end
