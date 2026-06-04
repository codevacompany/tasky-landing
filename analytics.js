/**
 * Tasky Pro landing — GA4 + Meta Pixel tracking helpers.
 * Requires gtag (GA4) loaded before this script. fbq is optional.
 */
(function (global) {
  function gtagEvent() {
    if (typeof global.gtag === 'function') {
      global.gtag.apply(global, arguments);
    }
  }

  function trackLead(eventLabel, linkUrl) {
    gtagEvent('event', 'generate_lead', {
      event_label: eventLabel,
      link_url: linkUrl || undefined,
    });
    if (typeof global.fbq === 'function') {
      global.fbq('track', 'Lead');
    }
  }

  function trackContact(eventLabel) {
    gtagEvent('event', 'contact', {
      method: 'WhatsApp',
      event_label: eventLabel || 'WhatsApp flutuante',
    });
    if (typeof global.fbq === 'function') {
      global.fbq('track', 'Contact');
    }
  }

  function trackViewItemList(itemListName) {
    gtagEvent('event', 'view_item_list', {
      item_list_name: itemListName,
    });
    if (typeof global.fbq === 'function') {
      global.fbq('track', 'ViewContent');
    }
  }

  function trackBeginCheckout(itemListName) {
    gtagEvent('event', 'begin_checkout', {
      item_list_name: itemListName,
    });
    if (typeof global.fbq === 'function') {
      global.fbq('track', 'InitiateCheckout');
    }
  }

  global.TaskyAnalytics = {
    trackLead,
    trackContact,
    trackViewItemList,
    trackBeginCheckout,
  };
})(typeof window !== 'undefined' ? window : this);
