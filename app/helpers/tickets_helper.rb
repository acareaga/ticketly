module TicketsHelper
  def purchase_link_or_retired_notice
    if current_user
      if current_user.admin?
        link_to "Edit Ticket", edit_admin_ticket_path(@ticket.id)
      else
        get_purchase_link_or_retired_notice
      end
    else
      get_purchase_link_or_retired_notice
    end
  end

  def get_purchase_link_or_retired_notice
    if @ticket.retired?
      content_tag :p, "This ticket has been retired and may no longer be purchased."
    else
      link_to "Proceed To Ticket", new_cart_ticket_path(id: @ticket.id)
    end
  end
end
