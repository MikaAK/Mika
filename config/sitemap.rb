SitemapGenerator::Sitemap.default_host = 'http://www.mikakalathil.ca'
SitemapGenerator::Sitemap.create do
  add '/', :changefreq => 'weekly', :priority => 0.9
  add '/projects', :changefreq => 'weekly'
  add '/contact', :changefreq => 'weekly'
  add '/tos', :changefreq => 'yearly'
  add '/privacy', :changefreq => 'yearly'
end