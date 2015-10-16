
require 'minitest/autorun'

require_relative 'spec_helper'


describe 'babushka file template' do

  it 'requires exactly a single origin' do
    Dep('no origin.file').met?.must_be_nil
    Dep('both url and source.file').met?.must_be_nil
    Dep('both content and render.file').met?.must_be_nil
  end

  describe 'supported origins' do
    it 'includes content' do
      Dep('|tmp|ftt_content.txt.file').meet.must_equal true
      "/tmp/ftt_content.txt".p.read.must_equal "Howdy!"
    end
    it 'includes url' do
      Dep('|tmp|ftt_url.txt.file').meet.must_equal true
      "/tmp/ftt_url.txt".p.read.must_equal "Babushka rules!\nMultiline no less..."
    end
    it 'includes source' do
      skip
    end
    it 'includes render' do
      skip
    end
  end

end

# Remove all ftt (file template test) files
Minitest.after_run do
  `rm -f /tmp/ftt*`
end
