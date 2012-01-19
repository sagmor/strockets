module Strockets
  module Railties
    class Engine < ::Rails::Engine
      initializer 'strockets.configure_rails_initialization' do |app|
        app.assets.append_path Strockets.stitch_path

        app.assets.register_postprocessor(
          'application/javascript',
          Strockets::StitchPostprocessor
        )
      end
    end
  end
end
