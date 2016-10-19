# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( site.scss admin.scss site/home.scss site/show_case.scss site/service.scss site/static.scss site/blog.scss site/contact.scss )
Rails.application.config.assets.precompile += %w( site.js admin.js site/home.js site/show_case.js site/service.js site/blog.js site/contact.js )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
