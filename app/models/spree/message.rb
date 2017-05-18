class Spree::Message < ActiveRecord::Base
  MESSAGE_TYPES = %w(ads cart shipment available canceled).freeze
  belongs_to :message_image
  scope :by_user_id, -> (id) { where('type = ? OR user_id = ?', 'Spree::UniversalMessage', id).order('created_at DESC') }
end
