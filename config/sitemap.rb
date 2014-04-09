SitemapGenerator::Sitemap.default_host = 'http://mikakalathil.ca'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'daily', :priority => 0.9
  add '/projects', :changefreq => 'daily'
  add '/contact', :changefreq => 'daily'
  add '/tos', :changefreq => 'yearly'
  add '/privacy', :changefreq => 'yearly'
end