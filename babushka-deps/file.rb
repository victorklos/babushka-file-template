# file template for babushka
# see README.md and LICENCE
#
# (C) Copyright 2015 Victor Klos


meta 'file' do
  ORIGINS = [:content, :url, :source, :render]
  ORIGINS.each{|o| accepts_value_for o}

  template {
    def filename
      @filename ||= name.gsub(/\|/,'/').chomp '.file'
    end
    def supplied
      ORIGINS.select{|e|!send(e).nil?}
    end
    def invoke_curl src, file
      shell "curl #{src} > #{file}"
    end

    def create_with_content
      File.open(filename, 'wb') { |file| file.write content }
    end

    def create_with_url
      invoke_curl url, filename
    end

    def create_with_source
      invoke_curl "file://#{source.p}", filename
    end

    met? {
      if supplied.length != 1
        raise ArgumentError, "Specify exactly one of [#{ORIGINS.join(', ')}]"
      end
      filename.p.exists?
    }
    meet {
      origin = supplied.join
      send "create_with_#{origin}"
    }
  }
end

