module Octopress
  module Ink
    module Assets
      class Config < Asset

        def initialize(plugin, path)
          @root = plugin.assets_path
          @plugin = plugin
          @dir = plugin.slug
          @type = ''
          @exists = {}
          @file = path
        end

        def user_dir
          File.join Plugins.site.source, Plugins.custom_dir, @dir
        end

        def local_plugin_path
          File.join Plugins.site.source, @dir, @file
        end

        def read
          config = {}
          if @plugin.type != 'local_plugin'
            default = plugin_path
            if exists? default
              config = YAML.safe_load(File.open(default))
            end
          end
          override = user_path
          if exists? override
            config = config.deep_merge YAML.safe_load(File.open(override))
          end
          config
        end
      end
    end
  end
end

