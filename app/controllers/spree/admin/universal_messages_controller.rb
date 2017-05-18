class Spree::Admin::UniversalMessagesController < Spree::Admin::ResourceController
  def index
    @universal_messages = collection
  end

  def create
    if (image = params[:universal_message].delete(:message_image))
      file = image[:attachment]
      if file
        if @object.message_image.present?
          @object.message_image.destroy!
        end
        @object.message_image = Spree::MessageImage.create!(attachment: file)
      end
    end
    super
  end

  def update
    if (image = params[:universal_message].delete(:message_image))
      file = image[:attachment]
      if file
        if @object.message_image.present?
          @object.message_image.destroy!
        end
        @object.message_image = Spree::MessageImage.create!(attachment: file)
      end
    end
    super
  end

  private

  def collection
    params[:q] ||= {}
    @search = Spree::UniversalMessage.ransack(params[:q])
    @collection = @search.result.page(params[:page]).per(params[:per_page])
  end
end
