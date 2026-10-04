class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validate :checkin_at_cannot_be_in_the_past
  validate :checkout_at_must_be_after_checkin_at
  validate :guest_count_must_be_at_least_one

  private

  def checkin_at_cannot_be_in_the_past
    if checkin_at.present? && checkin_at < Date.current
      errors.add(:checkin_at, "は本日以降の日付を選択してください")
    end
  end

  def checkout_at_must_be_after_checkin_at
    if checkin_at.present? && checkout_at.present? && checkout_at <= checkin_at
      errors.add(:checkout_at, "はチェックインより後の日付を選択してください")
    end
  end

  def guest_count_must_be_at_least_one
    if guest_count.present? && guest_count < 1
      errors.add(:guest_count, "は１人以上で入力してください")
    end
  end
end
