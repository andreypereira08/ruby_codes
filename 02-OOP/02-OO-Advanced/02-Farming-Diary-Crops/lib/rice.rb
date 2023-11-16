# TODO: code the Rice class
require_relative "crop.rb"

class Rice < Crop

    def water!
      @grains += 5
    end

    def transplant!
        @grains += 10
    end
end