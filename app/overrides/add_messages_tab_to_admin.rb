Deface::Override.new(
  :virtual_path => "spree/layouts/admin",
  :name => 'messages_admin_tab',
  :insert_bottom => "[data-hook='admin_tabs']",
  :text => "<ul class='nav nav-sidebar'>
              <%= main_menu_tree Spree.t(:messages), icon: 'file', sub_menu: 'message', url: '#sidebar-messages' %>
            </ul>",
  :disabled => false
)
