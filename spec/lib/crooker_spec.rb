require 'spec_helper'

module Webcrooker
  describe Crooker do
    FakeWeb.register_uri(:get, "http://curia.com", :response => response_file("curia.com.response"))
    FakeWeb.register_uri(:get, "http://og.curia.com", :response => response_file("og.curia.com.response"))
    FakeWeb.register_uri(:get, "http://p.curia.com", :response => response_file("p.curia.com.response"))

    describe 'initialization' do
      before(:each) { @wc = Crooker.new('http://curia.com') }

      it 'should accept an URL' do
         @wc.url.should == 'http://curia.com'
      end

      it 'should use http:// as a default protocol' do
        @wc.url.should == 'http://curia.com'
      end

      it 'should store the protocol' do
        @wc.protocol.should == 'http'
      end

      it 'should set the host' do
        @wc.host.should == 'curia.com'
      end

      it 'should set profile' do
        @wc.profile.should be_kind_of(Webcrooker::Profile::BaseProfile)
      end
    end

    describe '#document' do
      it "should have a Nokogiri::HTML::Document as document" do
        @cr = Crooker.new('http://curia.com')
        @cr.document.should be_kind_of(Nokogiri::HTML::Document)
      end
    end

    describe '#page' do
      it "should have a String as page" do
        @cr = Crooker.new('http://curia.com')
        @cr.page.should be_kind_of(String)
      end
    end

    describe '#title' do
      context 'with base profile' do
        it 'should get the page title' do
          @cr = Crooker.new('http://curia.com')
          @cr.title.should == "Curia"
        end
      end
    end

    describe '#meta_description' do
      it 'should return the meta description' do
        @cr = Crooker.new('http://curia.com')
        @cr.meta_description.should == 'Sample meta descripion.'
      end
    end

    describe '#og_description' do
      it 'should return the og description' do
        @cr = Crooker.new('http://curia.com')
        @cr.og_description.should == 'Sample og descripion.'
      end
    end

    describe '#p_description' do
      it 'should return the p description' do
        @cr = Crooker.new('http://curia.com')
        @cr.p_description.should_not == nil
      end
    end

    describe '#description' do
      it 'should return the meta description' do
        @cr = Crooker.new('http://curia.com')
        @cr.description.should == 'Sample meta descripion.'
      end
    end

    describe '#images' do
      it 'should return an array of images' do
        @cr = Crooker.new('http://curia.com')
        @cr.images.should == ['/images/1.jpg', '/images/2.jpg']
      end
    end

    describe '#og_image' do
      it 'should return an og image' do
        @cr = Crooker.new('http://curia.com')
        @cr.og_image.should == '/images/og.jpg'
      end
    end

    describe '#image' do
      it 'should return an og image' do
        @cr = Crooker.new('http://curia.com')
        @cr.image.should == '/images/og.jpg'
      end
    end
  end
end
