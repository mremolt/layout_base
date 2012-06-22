module Jekyll
  require 'sprite_factory'

  class SpritesGenerator < Generator
    safe true

    def generate(site)
      css_file = StaticFile.new(site, site.config['source'], 'css', 'icons.css')
      img_file = StaticFile.new(site, site.config['source'], 'img', 'icons.png')

      puts "Generating sprites ..."
      SpriteFactory.run!('./img/icons',
                         library: 'chunkypng',
                         style: :css,
                         output_style: css_file.destination(site.config['destination']),
                         output_image: img_file.destination(site.config['destination']),
                         csspath: '../img/',
                         selector: '.icon_',
                        )

      site.static_files << css_file
      site.static_files << img_file
    end

  end
end
