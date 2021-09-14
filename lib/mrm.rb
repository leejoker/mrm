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
        mvn_path = where_mvn
        if m2_home.nil?
          File.expand_path("../..", mvn_path) unless mvn_path.nil? || mvn_path.empty?
        else
          m2_home
        end
      end

      def config_file(path = "#{user_home}/.m2/settings.xml")
        raise "Can't find command mvn" if maven_home.nil?

        path = "#{maven_home}/conf/settings.xml" unless File.exist?(path)
        path
      end

      def where_mvn
        if os == :windows
          p = `where mvn`&.split("\n")
          p[0] unless p.nil?
        else
          p = `whereis mvn`.gsub("/mvn:/", "")
          a = p&.split(" ")
          a[0] unless a.nil?
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
