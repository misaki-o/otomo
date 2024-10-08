require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Otomo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.time_zone = 'Tokyo'
    # DB側から受け取った時刻をどのタイムゾーンとして解釈するか
    config.active_record.default_timezone = :local  

    # デフォルトの言語を日本語に変更
    # デフォルトは:enになっている
    config.i18n.default_locale = :ja
    # localeファイルの読み込み設定
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.active_storage.variant_processor = :mini_magick

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
