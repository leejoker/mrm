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
        where_command = "whereis mvn"
        where_command = "where mvn" unless ENV["OS"].index("Windows").nil?
        where_command
      end

      def user_home
        if ENV["OS"].index("Windows").nil?
          Dir.home
        else
          ENV["USERPROFILE"]
        end
      end
    end
  end
end
