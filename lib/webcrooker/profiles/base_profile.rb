module Webcrooker
  module Profile
    class BaseProfile
      def title(document)
        document.css('title').inner_html.gsub(/\t|\n|\r/, '') rescue nil
      end

      def meta_description(document)
        document.xpath("//meta[@name='description']/@content").first.value rescue nil
      end

      def og_description(document)
        document.xpath("//meta[@property='og:description']/@content").first.value rescue nil
      end

      def p_description(document)
        document.search('//p').map(&:text).select{ |p| p.length > 120 }.first rescue nil
      end

      def description(document)
        if self.meta_description(document)
          self.meta_description(document)
        elsif self.og_description(document)
          self.og_description(document)
        else
          self.p_description(document)
        end
      end

      def images(document)
        document.search('//img').reject{|i| i.attributes['src'].blank? }.map{ |i| i.attributes['src'].value }.uniq
      end

      def og_image(document)
        document.xpath("//meta[@property='og:image']/@content").first.value rescue nil
      end

      def image(document)
        self.og_image(document).nil? ? self.images(document)[0] : self.og_image(document)
      end
    end
  end
end