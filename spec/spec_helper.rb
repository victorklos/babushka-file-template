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

