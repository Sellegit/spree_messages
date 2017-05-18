class Spree::MessageImage < Spree::Image
  attachment_definitions[:attachment][:styles] = {
    universal: '800x800>'
  }
  attachment_definitions[:attachment][:default_style] = :universal
  attachment_definitions[:attachment].delete(:url)
  attachment_definitions[:attachment].delete(:path)
end
