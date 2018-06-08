class User
  include Mongoid::Document
  field :username, type: String
  field :email, type: String
  field :type, type: String
  field :password, type: String

  embeds_many :documents, class_name: "Document"

  validates :type, :inclusion => { :in => %w(patient doctor pharmacist) }
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

  validates_uniqueness_of :email

end
