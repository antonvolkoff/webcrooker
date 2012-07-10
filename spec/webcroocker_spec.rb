require 'spec_helper'

describe Webcrooker do
  describe '#new' do
    it 'should return Crooker object' do
      Webcrooker.new('http://curia.com').should be_kind_of(Webcrooker::Crooker)
    end
  end
end