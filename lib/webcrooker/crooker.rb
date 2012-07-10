require 'open-uri'
require 'nokogiri'
require 'webcrooker/profiles/base_profile'

module Webcrooker
  class Crooker
    attr_reader :url, :protocol, :host

    def initialize(url)
      if URI.parse(url).scheme.nil?
        @url = 'http://' + url
      else
        @url = url
      end
      @protocol = URI.parse(url).scheme || 'http'
      @host = URI.parse(url).host
    end

    def document
      @document ||= Nokogiri::HTML(page) 
    end

    def page
      @page ||= open(@url).read
    end

    def profile
      @profile ||= Profile::BaseProfile.new
    end

    def title
      @title ||= self.profile.title(self.document)
    end

    def meta_description
      @meta_description ||= self.profile.meta_description(self.document)
    end

    def og_description
      @og_description ||= self.profile.og_description(self.document)
    end

    def p_description
      @p_description ||= self.profile.p_description(self.document)
    end

    def description
      @description ||= self.profile.description(self.document)
    end

    def images
      @images ||= self.profile.images(self.document)
    end

    def og_image
      @og_image ||= self.profile.og_image(self.document)
    end

    def image
      @image ||= self.profile.image(self.document)
    end
  end
end
