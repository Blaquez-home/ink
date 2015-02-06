require 'json'

module Octopress
  module Ink
    module Utils
      extend self

      def yaml_pretty_print(yaml)
        # Use json pretty_print, but make it look like yaml
        #
        JSON.pretty_generate(yaml)
          .sub(/\A{\n/,'')           # remove leading {
          .sub(/}\z/,'')           # remove trailing }
          .gsub(/^/,' ')           # indent
          .gsub(/"(.+?)":/,'\1:')  # remove quotes around keys
          .gsub(/,$/,'')        # remove commas from end of lines
          .gsub(/\w+: {\s+}\n/,'')  # remove keys with empty hashes
      end
    end
  end
end
