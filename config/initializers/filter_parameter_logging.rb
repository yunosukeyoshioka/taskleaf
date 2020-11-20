# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
#パスワードのログを[FILTERD]で出力しプライバシー保護
Rails.application.config.filter_parameters += [:password]
