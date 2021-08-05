module ApplicationHelper
  include Pagy::Frontend
  
  def default_meta_tags
    {
      site: 'Global Community',
      title: '世界中にいる語学の先生を見つけよう！　Global Community',
      reverse: true,
      separator: '|',
      description: '外国語を学びたい人同士をマッチング。チャットを使ってお互いの得意な言語を教え合うことができます。',
      keywords: '英語',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico'), sizes: '32x32' },
        { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: 'Global Community',
        title: '世界中にいる語学の先生を見つけよう！　Global Community',
        description: '外国語を学びたい人同士をマッチング。チャットを使ってお互いの得意な言語を教え合うことができます。', 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      }
    }
  end
  
end