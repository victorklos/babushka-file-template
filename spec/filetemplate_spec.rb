
require 'minitest/autorun'

require_relative 'spec_helper'


describe 'babushka file template' do

  it 'requires exactly a single origin' do
    Dep('no origin.file').met?.must_be_nil
    Dep('both gist and source.file').met?.must_be_nil
    Dep('both content and render.file').met?.must_be_nil
  end

  describe 'supported origins' do
    it 'include content' do
      Dep('|tmp|ftt_content.txt.file').meet.must_equal true
      `cat /tmp/ftt_content.txt`.must_equal "Howdy!"
    end
    it 'include url' do
      skip
    end
    it 'include source' do
      skip
    end
    it 'include render' do
      skip
    end
  end

end

# Remove all ftt (file template test) files
Minitest.after_run do
  `rm -f /tmp/ftt*`
end
