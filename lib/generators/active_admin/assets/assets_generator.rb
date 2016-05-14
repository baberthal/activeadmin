module ActiveAdmin
  module Generators
    class AssetsGenerator < Rails::Generators::Base

      class_option :without_sprockets,
                   desc: 'Install all assets (use this if you are not using sprockets)',
                   type: :boolean,
                   default: false

      source_root File.expand_path("../templates", __FILE__)

      def install_assets
        template 'active_admin.js.coffee', 'app/assets/javascripts/active_admin.js.coffee'
        template "active_admin.scss", "app/assets/stylesheets/active_admin.scss"
      end

      def install_all_css_and_coffee
        return unless options[:without_sprockets]

        asset_dir = File.expand_path('../../../../../app/assets', __FILE__)
        source_paths << asset_dir if File.directory? asset_dir

        directory 'javascripts/active_admin'
        directory 'images/active_admin'
        directory 'stylesheets/active_admin'
      end

    end
  end
end
