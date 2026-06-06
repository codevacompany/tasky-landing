/**
 * Tasky Pro landing — pushes events to dataLayer for GTM (GA4, Meta, Google Ads).
 * Requires the GTM container snippet loaded before this script.
 */
(function (global) {
  function pushEvent(payload) {
    global.dataLayer = global.dataLayer || [];
    global.dataLayer.push(payload);
  }

  function trackLead(eventLabel, linkUrl) {
    pushEvent({
      event: 'generate_lead',
      event_label: eventLabel,
      link_url: linkUrl || undefined,
    });
  }

  function trackContact(eventLabel) {
    pushEvent({
      event: 'contact',
      method: 'WhatsApp',
      event_label: eventLabel || 'WhatsApp flutuante',
    });
  }

  function trackViewItemList(itemListName) {
    pushEvent({
      event: 'view_item_list',
      item_list_name: itemListName,
    });
  }

  function trackPlanSimulatorView(simulatorName) {
    pushEvent({
      event: 'view_plan_simulator',
      simulator_name: simulatorName,
    });
  }

  global.TaskyAnalytics = {
    trackLead,
    trackContact,
    trackViewItemList,
    trackPlanSimulatorView,
  };
})(typeof window !== 'undefined' ? window : this);
