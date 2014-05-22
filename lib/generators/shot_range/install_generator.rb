module ShotRange
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates and copy ShotRange default files to your application."

      def copy_config_file
        template "shot_range.yml", "config/shot_range.yml"
      end
    end
  end
end
