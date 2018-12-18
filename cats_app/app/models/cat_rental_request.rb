class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :does_not_overlap_approved_request?

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.where.not('cat_id = ? AND end_date <= ? OR start_date >= ? ', 
    self.cat_id, self.start_date, self.end_date )
  end

  def overlapping_approved_requests
    self.overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request?
    !self.overlapping_approved_requests.exists?
  end
end
