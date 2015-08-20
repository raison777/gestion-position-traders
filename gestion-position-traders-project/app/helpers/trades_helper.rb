module TradesHelper
  def autocomplete_trader
    @autocomplete_trader = link_to("trader#autocomplete")
  end

  def autocomplete_action
    @autocomplete_action = link_to("action#autocomplete")
  end


end
