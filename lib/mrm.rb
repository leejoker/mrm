# frozen_string_literal: true

require_relative "mrm/version"
require_relative "mrm/xml"
require_relative "mrm/repositories"

module Mrm
  class Error < StandardError; end

  # get maven info
  class MavenSettings
    class << self
      def maven_home
        m2_home = ENV["M2_HOME"] if ENV["MAVEN_HOME"].nil?
        if m2_home.nil?
          path_array = `#{where_mvn}`&.split("\n")
          File.expand_path("../..", path_array[0]) unless path_array.nil?
        else
          m2_home
        end
      end

      def config_file(path = "#{user_home}/.m2/settings.xml")
        raise "Can't find command mvn" if maven_home.nil?

        path = "#{maven_home}/conf/settings.xml" if path.nil?
        path
      end

      def where_mvn
        if os == :windows
          "where mvn"
        else
          "whereis mvn"
        end
      end

      def user_home
        if os == :windows
          ENV["USERPROFILE"]
        else
          Dir.home
        end
      end

      def os
        host_os = RbConfig::CONFIG["host_os"]
        case host_os
        when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
          :windows
        when /darwin|mac os/
          :macosx
        when /linux/
          :linux
        when /solaris|bsd/
          :unix
        else
          raise "unknown os: #{host_os.inspect}"
        end
      end
    end
  end
end
