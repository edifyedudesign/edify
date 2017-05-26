require 'rack'
require 'rack/contrib/try_static'

# enable compression
use Rack::Deflater

require 'rack/rewrite'
use Rack::Rewrite do
  # Capture a path with any extension
  r301 %r{\/whatwedo(.*)?}, "/process"
  r301 %r{\/blogs}, "/blog"

  # Examples (probably just for chuck's reference):
  # r301 '/adventures-photography/2014/11/JOGLE-2/', '/adventures-photography/2014/12/JOGLE-2/$&'
  # r301 '/adventures-photography/2014/10/JOGLE/', '/adventures-photography/2014/11/JOGLE/'
  # r301 %r{^/([0-9]{4})/([0-9]{2})}, '/notebook'
  # r301 %r{^/notebook/page/(.*)}, '/notebook/$1'
  # r301 %r{^/page/(.*)}, '/notebook/$1'
  # r301 '/tag', '/notebook'
  # r301 '/category', '/notebook'
  # r301 %r{^/camera-roll/(.*)$}, '/adventures-photography/$1'
  # r301 '/camera-roll', '/adventures-photography'
  # r301 %r{^/feed/camera-roll/(.*)}, '/feed/adventures-photography/$1'
  # r301 '/feed/camera-roll', '/feed/adventures-photography/'
end

# static configuration (file path matches reuest path)
use Rack::TryStatic,
  :root => "_site",  # static files root dir
  :urls => %w[/],    # match all requests
  :try => ['.html', 'index.html', '/index.html'], # try these postfixes sequentially
  :gzip => true,     # enable compressed files
  :header_rules => [
    [:all, {'Cache-Control' => 'public, max-age=86400'}],
    [['css', 'js'], {'Cache-Control' => 'public, max-age=604800'}]
  ]

# otherwise 404 NotFound
notFoundPage = File.open('_site/index.html').read
run lambda { |_| [200, {'Content-Type' => 'text/html'}, [notFoundPage]]}
