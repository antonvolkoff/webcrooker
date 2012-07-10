require 'spec_helper'

module Webcrooker
  module Profile
    describe BaseProfile do
      before(:each) do 
        @crooker = Crooker.new('http://curia.com')
        @profile = BaseProfile.new
      end

      describe '#title(document)' do
        it 'sould return the page title' do
          @profile.title(@crooker.document).should == 'Curia'
        end 
      end

      describe '#meta_description(document)' do
        it 'should return the meta description' do
          desc = @profile.meta_description(@crooker.document)
          desc.should == 'Sample meta descripion.'
        end
      end

      describe '#og_description(document)' do
        it 'should return the og description' do
          desc = @profile.og_description(@crooker.document)
          desc.should == 'Sample og descripion.'
        end
      end

      describe '#p_description(document)' do
        it 'should return the p description' do
          desc = @profile.p_description(@crooker.document)
          desc.should be
        end
      end

      describe '#description(document)' do
        context 'when meta description is set' do
          it 'should return the meta description' do
            desc = @profile.description(@crooker.document)
            desc.should == 'Sample meta descripion.'
          end
        end

        context 'when og_description is set' do
          it 'should return the og description' do
            crooker = Crooker.new('http://og.curia.com')
            desc = @profile.description(crooker.document)
            desc.should == 'Sample og descripion.'
          end
        end

        context 'when neither meta nor og_description is set' do
          it 'should return the p description' do
            crooker = Crooker.new('http://p.curia.com')
            desc = @profile.description(crooker.document)
            desc.should be
          end 
        end
      end

      describe '#images(document)' do
        it 'should return an array of images' do
          images = @profile.images(@crooker.document)
          images.should == ['/images/1.jpg', '/images/2.jpg']
        end
      end

      describe '#og_image(document)' do
        it 'should return an og image' do
          images = @profile.og_image(@crooker.document)
          images.should == '/images/og.jpg'
        end
      end

      describe '#image(document)' do
        it 'should return an og image' do
          images = @profile.image(@crooker.document)
          images.should == '/images/og.jpg'
        end
      end
    end
  end
end