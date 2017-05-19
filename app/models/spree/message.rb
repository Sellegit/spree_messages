class Spree::Message < ActiveRecord::Base
  MESSAGE_TYPE_SHIPMENT_UPDATED = 'shipment_updated'
  MESSAGE_TYPE_ORDER_CANCELED = 'order_canceled'
  belongs_to :message_image
  scope :by_user_id, -> (id) { where('type = ? OR user_id = ?', 'Spree::UniversalMessage', id).order('created_at DESC') }
end
