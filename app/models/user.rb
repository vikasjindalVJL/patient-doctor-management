class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :username, type: String
  field :email, type: String
  field :type, type: String
  field :encrypted_password, type: String

  embeds_many :documents, class_name: "Document"

  validates :type, :inclusion => { :in => %w(patient doctor pharmacist) }
  validates :username, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email

end
