Spree::Shipment.class_eval do
  state_machine.after_transition to: :shipped do |shipment, _|
    if (user = shipment.order.try(:user))
      title = I18n.t(:shipment_updated_title, scope: 'activerecord.models.spree/personal_message')
      content = I18n.t(
        :shipment_updated_content, 
        scope: 'activerecord.models.spree/personal_message', 
        shipment_number: shipment.number, 
        order_number: shipment.order.number
      )
      Spree::PersonalMessage.create!(
        title: title, 
        content: content, 
        user_id: user.id,
        message_type: Spree::Message::MESSAGE_TYPE_SHIPMENT_UPDATED,
        route: "app:orders/#{shipment.order.id}"    #TODO: to be separated
      )
    end
  end
end

