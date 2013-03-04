require 'refinerycms-core'

module Refinery
  autoload :FbMetatagsGenerator, 'generators/refinery/fb_metatags_generator'

  module FbMetatags
    require 'refinery/fb_metatags/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
