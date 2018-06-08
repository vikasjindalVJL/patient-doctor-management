class Document
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :user

  field :url, type: String
  field :file_name, type: String
  field :type, type: String
end
