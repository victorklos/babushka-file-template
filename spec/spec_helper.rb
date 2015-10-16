require_relative '/usr/local/babushka/lib/babushka'
include Babushka::DSL

# Suppress logging when babushka runs as part of spec
SUPPRESS_LOGGING = false
if SUPPRESS_LOGGING
  module Babushka
    module LogHelpers
      def log message, opts = {}, &block
      end
    end
  end
end


# Define the deps for testing

dep 'no origin.file' do
end

dep 'both url and source.file' do
  source "/tmp/tralala"
  url "somewhere at the interweb"
end

dep 'both content and render.file' do
  content "setting=true"
  render "from some erb"
end

dep '|tmp|ftt_content.txt.file' do
  content "Howdy!"
end

dep '|tmp|ftt_url.txt.file' do
  url "https://gist.githubusercontent.com/victorklos/5e0d5d5c79465e2d7587/raw/8b745706d85f84d9806ab3c918e6a3e0ed06d2b3/somegist.txt"
end

dep '|tmp|ftt_source.txt.file' do
  source "spec/fixtures/source.txt"
end

