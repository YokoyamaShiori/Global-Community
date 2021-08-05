# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://grobal-community.herokuapp.com/"

SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'daily'
end
