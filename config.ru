require 'rack'

# enable compression
use Rack::Deflater

require 'rack/rewrite'
use Rack::Rewrite do
  # Capture a path with any extension
  r301 %r{/alternative-learning/2014/09/16/well-here-we-are(.*)?}, "/blog/well-here-we-are"
  r301 %r{/alternative-learning/2014/11/03/making-the-makers-sell(.*)?}, "/blog/making-the-makers-sell"
  r301 %r{/alternative-learning/2014/12/14/flights-of-fancy-for-safety(.*)?}, "/blog/flights-of-fancy-for-safety"
  r301 %r{/human-centered-design/2014/12/20/the-band-aid-box(.*)?}, "/blog/the-band-aid-box"
  r301 %r{/instructional-design/2014/10/27/making-the-museum-fun(.*)?}, "/blog/making-the-museum-fun"
  r301 %r{/instructional-design/2014/12/01/patagonias-big-teach(.*)?}, "/blog/patagonias-big-teach"
  r301 %r{/instructional-design/2015/01/02/rules-of-the-road(.*)?}, "/blog/rules-of-the-road"
  r301 %r{/instructional-design,%20human-centered-design/2015/02/01/everything-is-learning(.*)?}, "/blog/everything-is-learning"
  r301 %r{/instructional-design,%20knowledge-management/2015/04/13/learning-design-for-small-business(.*)?}, "/blog/learning-design-for-small-business"
  r301 %r{/instructional-design,%20orient-onboard/2015/03/16/Its-all-fun-and-games(.*)?}, "/blog/its-all-fun-and-games"
  r301 %r{/instructional-design,%20orient-onboard,%20knowledge-management/2015/03/23/Can-I-Use-Learning-Design(.*)?}, "/blog/can-i-use-learning-design"
  r301 %r{/instructional-design,%20orient-onboard,%20knowledge-management/2015/05/20/why-getting-onboard-is-so-important(.*)?}, "/blog/why-getting-onboard-is-so-important"
  r301 %r{/knowledge%20management/2015/10/26/big-news(.*)?}, "/blog/big-news"
  r301 %r{/knowledge%20management/2017/01/03/happy-new-year(.*)?}, "/blog/happy-new-year"
  r301 %r{/orient-onboard/2015/09/20/get-onboard(.*)?}, "/blog/get-onboard"
  r301 %r{/orient-onboard,%20instructional-design/2015/07/02/what-l%26d-forgot(.*)?}, "/blog/what-l%26d-forgot"
  r301 %r{/orient-onboard,%20knowledge-management/2015/05/19/difference-between-onboarding-and-orienation(.*)?}, "/blog/difference-between-onboarding-and-orienation"
  r301 %r{/orient-onboard,%20knowledge-management/2015/06/15/write-the-docs-hr-edition(.*)?}, "/blog/write-the-docs-hr-edition"
  r301 %r{/whatwedo(.*)?}, "/process"
  r301 %r{/whyweredifferent(.*)?}, "/about"
  # r301 %r{/index(.*)?}, "/contact" # This can't be represented because
  # it relies on a # in the url which doesn't get sent to the server.
  r301 %r{^/blog.html$}, "/blog"
  r301 %r{/orient-onboard.html}, "/category/onboarding"
  r301 %r{^/orient-onboard/?$}, "/category/onboarding"
  r301 %r{/human-centered-design.html}, "/category/human-centered-design"
  r301 %r{^/human-centered-design/?$}, "/category/human-centered-design"
  r301 %r{/knowledge-management.html}, "/category/knowledge-management"
  r301 %r{^/knowledge-management/?$}, "/category/knowledge-management"
  r301 %r{/instructional-design.html}, "/category/instructional-design"
  r301 %r{^/instructional-design/?$}, "/category/instructional-design"
  r301 %r{/alternative-learning.html}, "/category/alternative-learning"
  r301 %r{^/alternative-learning/?$}, "/category/alternative-learning"
end

# static configuration (file path matches request path)
require 'rack/contrib/try_static'
use Rack::TryStatic,
  :root => "_site",  # static files root dir
  :urls => %w[/],    # match all requests
  :try => ['.html', 'index.html', '/index.html'], # try these postfixes sequentially
  :gzip => true,     # enable compressed files
  :header_rules => [
    [:all, {'Cache-Control' => 'public, max-age=86400'}],
    [['css', 'js'], {'Cache-Control' => 'public, max-age=604800'}],
    [:fonts, {'Access-Control-Allow-Origin' => '*'}]
  ]

# otherwise 404 NotFound
notFoundPage = File.open('_site/404.html').read
run lambda { |_| [404, {'Content-Type' => 'text/html'}, [notFoundPage]]}
