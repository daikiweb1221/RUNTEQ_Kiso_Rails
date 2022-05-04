require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RunteqNormal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # アプリケーションが対応している言語のホワイトリスト
    config.i18n.available_locales = %i[ja en]

    # デフォルトの言語設定
    config.i18n.default_locale = :ja

    # 言語ファイル階層ごとに設定するための記述
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Please use `Rails.root.join('path/to')` instead.と言われたら、下記のようにする。
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]

    config.generators do |g|
      g.assets false
      # CSS/JSファイルを生成しない
      g.helper false
      # ヘルパーファイルを生成しない
      g.test_framework false
      # テストファイルを生成しない
      g.skip_routes true
      # ルーティングの変更をスキップ
end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
