class Spree::Admin::PersonalMessagesController < Spree::Admin::ResourceController
  def index
    @personal_messages = collection
  end

  private

  def collection
    params[:q] ||= {}
    @search = Spree::PersonalMessage.ransack(params[:q])
    @collection = @search.result.page(params[:page]).per(params[:per_page])
  end
end
