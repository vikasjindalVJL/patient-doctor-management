class RequestAccess
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :requestor, class_name: 'User'
  belongs_to :grantor, class_name: 'User'

  field :status, type: String, default: 'pending'

  validates :status, :inclusion => { :in => %w(pending approved denied) }
  validates_uniqueness_of :requestor_id, scope: :grantor_id

  # TODO: Send Email notification to requestor on status change
  def send_email
  end

end
