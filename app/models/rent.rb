class Rent < ApplicationRecord
  belongs_to :vehicle

  validates :vehicle, presence: true
  validate :vehicle_already_in_use
  validates :cpf, presence: true, cpf: true
  validates :start_date, presence: true
  validate :start_date_is_today_forward
  validates :end_date, presence: true
  validate :end_date_is_not_before_start_date

  def vehicle_already_in_use
    rents_for_period = Rent.where(vehicle: self.vehicle)
      .where("(rents.start_date, rents.end_date) OVERLAPS (?, ?)", self.start_date, self.end_date)

    if (self.id.present?)
      rents_for_period = rents_for_period.where.not(id: self.id)
    end

    @errors.add(:vehicle, "already in use for this period") if (rents_for_period.count > 0)
  end

  def start_date_is_today_forward
    return if self.start_date.nil?

    if (self.start_date < Date.today())
      @errors.add(:start_date, "must be today forward")
    end
  end

  def end_date_is_not_before_start_date
    return if self.start_date.nil? || self.end_date.nil?

    if (self.end_date < self.start_date)
      @errors.add(:end_date, "cannot be before start date")
    end
  end
end
