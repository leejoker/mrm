# frozen_string_literal: true

require "nokogiri"
require "fileutils"

module Mrm
  # Mrm settings.xml file control
  class SettingsXML
    attr_accessor :settings_file, :repositories, :doc

    def initialize(settings_file)
      @settings_file = settings_file
      @doc = Nokogiri::XML(File.open(@settings_file))
      @repositories = @doc.css("mirror")
    end

    def backup_settings
      bak_file = "#{@settings_file}.bak"
      FileUtils.cp(@settings_file, bak_file) unless File.exist?(bak_file)
    end

    def restore_settings
      bak_file = "#{@settings_file}.bak"
      FileUtils.cp(bak_file, @settings_file) if File.exist?(bak_file)
      File.delete(bak_file)
    end

    def delete_mirrors
      backup_settings
      @repositories.each(&:remove)
    end

    def change_mirror(mirror_info)
      delete_mirrors
      mirror_doc = Nokogiri::XML(mirror_info)
      @doc.css("mirrors").first << mirror_doc.css("mirror")
    end

    def write_config
      File.open(@settings_file, "w") do |file|
        file.write(@doc.to_xml)
      end
    end
  end
end
