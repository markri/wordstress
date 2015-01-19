module Wordstress
  class Utils

    # Transform a given URL into a directory name to be used to store data
    def self.target_to_dirname(target)
      target.split("://")[1].gsub('.','_').gsub('/', '').gsub(':', '_')
    end

    def self.build_output_dir(root, target)
      attempt=0
      today=Time.now.strftime("%Y%m%d")

      while 1 do

        proposed = File.join(root, Wordstress::Utils.target_to_dirname(target), today)
        if attempt != 0
          proposed += "_#{attempt}"
        end

        return proposed unless Dir.exists?(proposed)
        attempt +=1 if Dir.exists?(proposed)
      end


    end

  end
end
