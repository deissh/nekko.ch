RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  RailsAdmin.config do |config|
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
    # history_index
    # history_show
  end

  config.model 'Anime' do
    include_all_fields
    field(:posters, :serialized) { html_attributes rows: '3', cols: '70' }
    field(:genres, :serialized) { html_attributes rows: '5', cols: '70' }
    field(:countries, :serialized) { html_attributes rows: '5', cols: '70' }
    field(:actors, :serialized) { html_attributes rows: '5', cols: '70' }
    field(:directors, :serialized) { html_attributes rows: '5', cols: '70' }
    field(:studios, :serialized) { html_attributes rows: '5', cols: '70' }

  end
end
