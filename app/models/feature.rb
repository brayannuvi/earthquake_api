class Feature < ApplicationRecord
    has_many :comments
    validate :uniq_external_id
    validates :title, presence: true
    validates :external_url, presence: true
    validates :place, presence: true
    validates :mag_type, presence: true
    validates :place, presence: true
    validates :magnitude, numericality: { only_integer: false, greater_than_or_equal_to: -1.0, less_than_or_equal_to: 10.0 }
    validates :longitude, presence: true, numericality: { only_integer: false, greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }
    validates :latitude, presence: true, numericality: { only_integer: false, greater_than_or_equal_to: -90, less_than_or_equal_to: 90.0 }

    private

    def uniq_external_id
        if Feature.exists?(external_id: self.external_id)
            errors.add(:external_id, "_id already exist")
        end
    end

end
