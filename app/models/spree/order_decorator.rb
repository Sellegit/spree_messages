Spree::Order.class_eval do
  state_machine.after_transition to: :canceled do |order, _|
    if (user = order.try(:user))
      title = I18n.t(:order_canceled_title, scope: 'activerecord.models.spree/personal_message')
      content = I18n.t(
        :order_canceled_content, 
        scope: 'activerecord.models.spree/personal_message', 
        order_number: order.number
      )
      Spree::PersonalMessage.create!(
        title: title, 
        content: content, 
        user_id: user.id,
        message_type: Spree::Message::MESSAGE_TYPE_ORDER_CANCELED,
        route: "app:orders/#{order.id}"    # TODO: to be separated
      )
    end
  end
end
