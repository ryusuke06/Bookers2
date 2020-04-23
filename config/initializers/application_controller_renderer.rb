# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

#refileの画像投稿 RuntimeError回避
Refile.secret_key = '49228c863a194a10c3e6f74a0ffb2521da19cf12c6972c29e608916a158e8c5a9342a686696a01117a27bd3bb4a785acbb31d11e9e9e09da89b43a6aaa7d1f52'