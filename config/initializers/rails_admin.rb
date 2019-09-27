# frozen_string_literal: true

RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  # rubocop:disable Lint/ShadowingOuterLocalVariable
  RailsAdmin.config do |config|
    # rubocop:enable Lint/ShadowingOuterLocalVariable
    config.authenticate_with do
      warden.authenticate! scope: :admin
    end
    config.current_user_method(&:current_admin)
  end
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.audit_with :history

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    history_index
    history_show
  end

  config.model 'Anime' do
    include_all_fields

    field :poster, :active_storage do
      pretty_value do
        if value
          path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
          bindings[:view].tag(:img,
            src: Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true),
            class: 'preview img-thumbnail')
        end
      end
    end

    field :background, :active_storage do
      pretty_value do
        if value
          path = Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true)
          bindings[:view].tag(:img,
            src: Rails.application.routes.url_helpers.rails_blob_path(value, only_path: true),
            class: 'preview img-thumbnail')
        end
      end
    end

    field(:countries, :serialized) { html_attributes rows: '5', cols: '70' }
    field(:actors, :serialized) { html_attributes rows: '5', cols: '70' }
    field(:directors, :serialized) { html_attributes rows: '5', cols: '70' }
    field(:studios, :serialized) { html_attributes rows: '5', cols: '70' }
  end
end
