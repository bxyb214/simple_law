###*******************************************************
#
# Custom Javascript code for AppStrap Bootstrap theme
# Written by Themelize.me (http://themelize.me)
#
#*****************************************************
###

###global jRespond ###

jPM = {}
PLUGINS_PATH = '/assets/'
SLIDER_REV_VERSION = '4.2'
$(document).on 'ready page:load', ->
  'use strict'
  # ****************************************************************
  # Custom / Bootstrap onLoad functionality
  #
  # ****************************************************************
  # ----------------------------------------------------------------
  # Search form show/hide
  # ----------------------------------------------------------------
  if $('[data-toggle=search-form]').length > 0
    trigger = $('[data-toggle=search-form]')
    target = trigger.data('target')
    $('[data-toggle=search-form]').click ->
      $(target).toggleClass 'open'
      $(target + ' .search').focus()
      $(trigger).toggleClass 'open'
      $('html').toggleClass 'search-form-open'
      return
    $('[data-toggle=search-form-close]').click ->
      $(target).removeClass 'open'
      $(trigger).removeClass 'open'
      $('html').removeClass 'search-form-open'
      return
  # ----------------------------------------------------------------
  # colour switch - demo only
  # ----------------------------------------------------------------
  defaultColour = 'green'
  jQuery('.colour-switcher a').click ->
    c = jQuery(this).attr('href').replace('#', '')
    cacheBuster = 3 * Math.floor(Math.random() * 6)
    jQuery('.colour-switcher a').removeClass 'active'
    jQuery('.colour-switcher a.' + c).addClass 'active'
    if c != defaultColour
      jQuery('#colour-scheme').attr 'href', 'css/colour-' + c + '.css?x=' + cacheBuster
    else
      jQuery('#colour-scheme').attr 'href', '#'
    return
  # ----------------------------------------------------------------
  # IE placeholders
  # ----------------------------------------------------------------
  if navigator.userAgent.toLowerCase().indexOf('msie') > -1
    jQuery('[placeholder]').focus(->
      input = jQuery(this)
      if input.val() == input.attr('placeholder')
        if @originalType
          @type = @originalType
          delete @originalType
        input.val ''
        input.removeClass 'placeholder'
      return
    ).blur(->
      input = jQuery(this)
      if input.val() == ''
        input.addClass 'placeholder'
        input.val input.attr('placeholder')
      return
    ).blur()
  # ----------------------------------------------------------------
  # Plugin: Bootstrap Hover Dropdown
  # @see: https://github.com/CWSpear/bootstrap-hover-dropdown
  # ----------------------------------------------------------------
  if jQuery('[data-hover="dropdown"]').length > 0
    jQuery().themeLoadPlugin [ 'bootstrap-hover-dropdown.js' ], [], null, 'append'
  # ----------------------------------------------------------------
  # Bootstrap tooltip
  # @see: http://getbootstrap.com/javascript/#tooltips
  # ----------------------------------------------------------------
  # invoke by adding data-toggle="tooltip" to a tags (this makes it validate)
  if jQuery().tooltip
    jQuery('body').tooltip
      selector: '[data-toggle=tooltip]'
      container: 'body'
  # ----------------------------------------------------------------
  # Bootstrap popover
  # @see: http://getbootstrap.com/javascript/#popovers
  # ----------------------------------------------------------------
  # invoke by adding data-toggle="popover" to a tags (this makes it validate)
  if jQuery().popover
    jQuery('body').popover
      selector: '[data-toggle=popover]'
      container: 'body'
      trigger: 'hover'
  # ----------------------------------------------------------------
  # Submenus
  # ----------------------------------------------------------------
  jQuery('html').themeSubMenus()
  # ----------------------------------------------------------------
  # allow any page element to set page class
  # ----------------------------------------------------------------
  jQuery('[data-page-class]').each ->
    jQuery('html').addClass jQuery(this).data('page-class')
    return
  # ----------------------------------------------------------------
  # Detect Bootstrap fixed header
  # @see: http://getbootstrap.com/components/#navbar-fixed-top
  # ----------------------------------------------------------------
  if jQuery('.navbar-fixed-top').size() > 0
    jQuery('html').addClass 'has-navbar-fixed-top'
  # ----------------------------------------------------------------
  # show hide for hidden header
  # ----------------------------------------------------------------
  jQuery('[data-toggle=show-hide]').each ->
    jQuery(this).click ->
      `var target`
      state = 'open'
      #assume target is closed & needs opening
      target = jQuery(this).attr('data-target')
      targetState = jQuery(this).attr('data-target-state')
      callback = jQuery(this).attr('data-callback')
      #allows trigger link to say target is open & should be closed
      if typeof targetState != 'undefined' and targetState != false
        state = targetState
      if state == undefined
        state = 'open'
      jQuery(target).toggleClass 'show-hide-' + state
      jQuery(this).toggleClass state
      if callback and typeof callback == 'function'
        callback()
      return
    return
  # ****************************************************************
  # Third-party plugin intergration
  #
  # ****************************************************************
  # ----------------------------------------------------------------
  # Plugin: Bootstrap switch integration
  # @see: http://www.bootstrap-switch.org/
  # ----------------------------------------------------------------
  if jQuery('[data-toggle=switch]').length > 0

    initBootstrapSwitch = ->
      jQuery('[data-toggle=switch]').bootstrapSwitch()
      return

    jQuery().themeLoadPlugin [ 'bootstrap-switch.js' ], [ 'bootstrap-switch.css' ], initBootstrapSwitch
  # ----------------------------------------------------------------
  # Plugin: jPanel Menu
  # data-toggle=jpanel-menu must be present on .navbar-btn
  # @todo - allow options to be passed via data- attr
  # @see: http://jpanelmenu.com/
  # ----------------------------------------------------------------
  if jQuery('[data-toggle=jpanel-menu]').length > 0

    initjPMenu = ->
      jpanelMenuTrigger = jQuery('[data-toggle=jpanel-menu]')
      jPM = jQuery.jPanelMenu(
        menu: jpanelMenuTrigger.data('target')
        direction: jpanelMenuTrigger.data('direction')
        trigger: '.' + jpanelMenuTrigger.attr('class')
        excludedPanelContent: '.jpanel-menu-exclude'
        openPosition: '280px'
        afterOpen: ->
          jpanelMenuTrigger.addClass 'open'
          jQuery('html').addClass 'jpanel-menu-open'
          return
        afterClose: ->
          jpanelMenuTrigger.removeClass 'open'
          jQuery('html').removeClass 'jpanel-menu-open'
          return
      )
      #jRespond settings
      jRes = jRespond([ {
        label: 'small'
        enter: 0
        exit: 991
      } ])
      #turn jPanel Menu on/off as needed
      jRes.addFunc
        breakpoint: 'small'
        enter: ->
          jPM.on()
          jQuery('html').themeSubMenus()
          return
        exit: ->
          jPM.off()
          jQuery('html').themeSubMenus()
          return
      return

    jQuery().themeLoadPlugin [
      'jquery.jpanelmenu.js'
      'jRespond.js'
    ], [], initjPMenu
  # ----------------------------------------------------------------
  # Plugin: clingify (sticky navbar)
  # @see: http://theroux.github.io/clingify/
  # ----------------------------------------------------------------
  if jQuery('[data-toggle=clingify]').length > 0

    initClingify = ->
      jQuery('[data-toggle=clingify]').clingify breakpoint: 1010
      return

    jQuery().themeLoadPlugin [ 'jquery.clingify.js' ], [ 'clingify.css' ], initClingify
  # ----------------------------------------------------------------
  # Plugin: flexslider
  # @see: http://www.woothemes.com/flexslider/
  # ----------------------------------------------------------------
  if jQuery('.flexslider').length > 0

    initFlexslider = ->
      jQuery('.flexslider').each ->
        sliderSettings =
          animation: jQuery(this).attr('data-transition')
          selector: '.slides > .slide'
          controlNav: true
          smoothHeight: true
          start: (slider) ->
#hide all animated elements
            slider.find('[data-animate-in]').each ->
              jQuery(this).css 'visibility', 'hidden'
              return
            #slide backgrounds
            slider.find('.slide-bg').each ->
              jQuery(this).css 'background-image': 'url(' + jQuery(this).data('bg-img') + ')'
              jQuery(this).css('visibility', 'visible').addClass('animated').addClass jQuery(this).data('animate-in')
              return
            #animate in first slide
            slider.find('.slide').eq(1).find('[data-animate-in]').each ->
              jQuery(this).css 'visibility', 'hidden'
              if jQuery(this).data('animate-delay')
                jQuery(this).addClass jQuery(this).data('animate-delay')
              if jQuery(this).data('animate-duration')
                jQuery(this).addClass jQuery(this).data('animate-duration')
              jQuery(this).css('visibility', 'visible').addClass('animated').addClass jQuery(this).data('animate-in')
              jQuery(this).one 'webkitAnimationEnd oanimationend msAnimationEnd animationend', ->
                jQuery(this).removeClass jQuery(this).data('animate-in')
                return
              return
            return
          before: (slider) ->
            slider.find('.slide-bg').each ->
              jQuery(this).removeClass(jQuery(this).data('animate-in')).removeClass('animated').css 'visibility', 'hidden'
              return
            #hide next animate element so it can animate in
            slider.find('.slide').eq(slider.animatingTo + 1).find('[data-animate-in]').each ->
              jQuery(this).css 'visibility', 'hidden'
              return
            return
          after: (slider) ->
#hide animtaed elements so they can animate in again
            slider.find('.slide').find('[data-animate-in]').each ->
              jQuery(this).css 'visibility', 'hidden'
              return
            #animate in next slide
            slider.find('.slide').eq(slider.animatingTo + 1).find('[data-animate-in]').each ->
              if jQuery(this).data('animate-delay')
                jQuery(this).addClass jQuery(this).data('animate-delay')
              if jQuery(this).data('animate-duration')
                jQuery(this).addClass jQuery(this).data('animate-duration')
              jQuery(this).css('visibility', 'visible').addClass('animated').addClass jQuery(this).data('animate-in')
              jQuery(this).one 'webkitAnimationEnd oanimationend msAnimationEnd animationend', ->
                jQuery(this).removeClass jQuery(this).data('animate-in')
                return
              return
            $(window).trigger 'resize'
            return
        sliderNav = jQuery(this).attr('data-slidernav')
        if sliderNav != 'auto'
          sliderSettings = $.extend({}, sliderSettings,
            manualControls: sliderNav + ' li a'
            controlsContainer: '.flexslider-wrapper')
        jQuery('html').addClass 'has-flexslider'
        jQuery(this).flexslider sliderSettings
        jQuery('.flexslider').resize()
        #make sure height is right load assets loaded
        return
      return

    jQuery().themeLoadPlugin [ 'jquery.flexslider.js' ], [ 'flexslider.css' ], initFlexslider
  # ----------------------------------------------------------------
  # Plugin: jQuery Quicksand plugin
  # @see: http://razorjack.net/quicksand/
  # ----------------------------------------------------------------
  if jQuery('[data-js=quicksand]').length > 0

    initQuicksand = ->
      jQuery('[data-js=quicksand]').each ->
        quicksandTrigger = jQuery(this).find(jQuery(this).data('quicksand-trigger'))
        quicksandTarget = jQuery(jQuery(this).data('quicksand-target'))
        quicksandTargetData = quicksandTarget.clone()
        filterId = 'all'
        filteredData = undefined
        quicksandTrigger.click (e) ->
          filterId = jQuery(this).data('quicksand-fid')
          filteredData = ''
          quicksandTrigger.parents('li').removeClass 'active'
          jQuery(this).parents('li').addClass 'active'
          if filterId == 'all'
            filteredData = quicksandTargetData.find('[data-quicksand-id]')
          else
            filteredData = quicksandTargetData.find('[data-quicksand-tid="' + filterId + '"]')
          quicksandTarget.quicksand(filteredData,
            duration: 600
            attribute: 'data-quicksand-id'
            adjustWidth: 'auto').addClass 'quicksand-target'
          e.preventDefault()
          return
        return
      return

#    $.getScript 'js/jquery-migrate-1.2.1.min.js'
    jQuery().themeLoadPlugin [ 'jquery.quicksand.js' ], [], initQuicksand
  # ----------------------------------------------------------------
  # Plugin: Slider Revolution
  # @see: http://codecanyon.net/item/slider-revolution-responsive-jquery-plugin/2580848
  # ----------------------------------------------------------------
  if jQuery('[data-toggle=slider-rev]').length > 0

    initSliderRev = ->
      jQuery('[data-toggle=slider-rev]').each ->
        sliderRevEl = $(this)
        sliderRevSettings = undefined
        sliderRevSettingsDefault =
          delay: 9000
          startheight: 500
          startwidth: 960
          fullScreenAlignForce: 'off'
          autoHeight: 'off'
          hideThumbs: 200
          thumbWidth: 100
          thumbHeight: 50
          thumbAmount: 3
          navigationType: 'bullet'
          navigationArrows: 'solo'
          hideThumbsOnMobile: 'off'
          hideBulletsOnMobile: 'off'
          hideArrowsOnMobile: 'off'
          hideThumbsUnderResoluition: 0
          navigationStyle: 'round'
          navigationHAlign: 'center'
          navigationVAlign: 'bottom'
          navigationHOffset: 0
          navigationVOffset: 20
          soloArrowLeftHalign: 'left'
          soloArrowLeftValign: 'center'
          soloArrowLeftHOffset: 20
          soloArrowLeftVOffset: 0
          soloArrowRightHalign: 'right'
          soloArrowRightValign: 'center'
          soloArrowRightHOffset: 20
          soloArrowRightVOffset: 0
          keyboardNavigation: 'on'
          touchenabled: 'on'
          onHoverStop: 'on'
          stopAtSlide: -1
          stopAfterLoops: -1
          hideCaptionAtLimit: 0
          hideAllCaptionAtLimit: 0
          hideSliderAtLimit: 0
          shadow: 0
          fullWidth: 'off'
          fullScreen: 'off'
          minFullScreenHeight: 0
          fullScreenOffsetContainer: ''
          dottedOverlay: 'none'
          forceFullWidth: 'off'
          spinner: 'spinner0'
        sliderRevSettings = $.extend({}, sliderRevSettingsDefault, sliderRevEl.data())
        sliderRevEl.revolution sliderRevSettings
        return
      return

    jQuery().themeLoadPlugin(
      ["jquery.themepunch.plugins.min.js", "jquery.themepunch.revolution.js"],
      ["themepunch.settings.css"],
      initSliderRev
    );
  # ----------------------------------------------------------------
  # Plugin: Backstretch
  # @see: http://srobbin.com/jquery-plugins/backstretch/
  # ----------------------------------------------------------------
  if jQuery('[data-toggle=backstretch]').length > 0

    initBackstretch = ->
      jQuery('[data-toggle=backstretch]').each ->
        backstretchEl = $(this)
        backstretchTarget = jQuery
        backstretchImgs = []
        backstretchSettings =
          fade: 750
          duration: 4000
        # Get images from element
        jQuery.each backstretchEl.data('backstretch-imgs').split(','), (k, img) ->
          backstretchImgs[k] = img
          return
        # block level element
        if backstretchEl.data('backstretch-target')
          backstretchTarget = backstretchEl.data('backstretch-target')
          if backstretchTarget == 'self'
            backstretchTarget = backstretchEl
          else
            if $(backstretchTarget).length > 0
              backstretchTarget = $(backstretchTarget)
        if backstretchImgs
          $('html').addClass 'has-backstretch'
          # Merge in any custom settings
          backstretchSettings = $.extend({}, backstretchSettings, backstretchEl.data())
          backstretchTarget.backstretch backstretchImgs, backstretchSettings
          # add overlay
          if backstretchEl.data('backstretch-overlay') != false
            $('.backstretch').prepend '<div class="backstretch-overlay"></div>'
            if backstretchEl.data('backstretch-overlay-opacity')
              $('.backstretch').find('.backstretch-overlay').css('background', 'white').fadeTo 0, backstretchEl.data('backstretch-overlay-opacity')
        return
      return

    jQuery().themeLoadPlugin [ 'jquery.backstretch.js' ], [], initBackstretch
  # ----------------------------------------------------------------
  # Plugin: FitVids.js
  # @see: http://fitvidsjs.com/
  # ----------------------------------------------------------------
  selectors = [
    'iframe[src*=\'player.vimeo.com\']'
    'iframe[src*=\'youtube.com\']'
    'iframe[src*=\'youtube-nocookie.com\']'
    'iframe[src*=\'kickstarter.com\'][src*=\'video.html\']'
    'object'
    'embed'
  ]
  if $(this).find(selectors.join(',')).length > 0

    initFitVids = ->
      $('body').fitVids ignore: '.no-fitvids'
      return

    jQuery().themeLoadPlugin [ 'jquery.fitvids.js' ], [], initFitVids
  # ----------------------------------------------------------------
  # Plugin: Isotope (blog grid & sorting)
  # @see: http://isotope.metafizzy.co/
  # Also loads plugin: Imagesloaded (utility for Isotope plugin)
  # @see: https://github.com/desandro/imagesloaded
  # ----------------------------------------------------------------
  if jQuery('[data-toggle=isotope-grid]').length > 0

    initIsotope = ->
      jQuery('[data-toggle=isotope-grid]').each ->
        container = $(this)
        options = $(this).data('isotope-options')
        # Invoke isotope
        container.isotope options
        # If imagesLoaded avaliable use it
        if jQuery().imagesLoaded
          container.imagesLoaded ->
            container.isotope 'layout'
            return
        $('body').addClass 'has-isotope'
        return
      return

    jQuery().themeLoadPlugin [
      'imagesloaded.pkgd.js'
      'isotope.pkgd.js'
    ], [], initIsotope
  # ----------------------------------------------------------------
  # Plugin: Prism (code highlighting)
  # @see: http://prismjs.com/
  # ----------------------------------------------------------------
  if jQuery('code').length > 0
    jQuery().themeLoadPlugin [ 'prism.js' ], [ 'prism.css' ]
  # ----------------------------------------------------------------
  # Plugin: OwlCarousel (carousel displays)
  # @see: http://owlgraphic.com/owlcarousel/
  # ----------------------------------------------------------------
  if jQuery('[data-toggle="owl-carousel"]').length > 0

    initOwlCarousel = ->
      owlCarouselSettingsDefault =
        items: 5
        itemsCustom: false
        itemsDesktop: [
          1199
          4
        ]
        itemsDesktopSmall: [
          979
          3
        ]
        itemsTablet: [
          768
          2
        ]
        itemsTabletSmall: false
        itemsMobile: [
          479
          1
        ]
        singleItem: false
        itemsScaleUp: false
        slideSpeed: 200
        paginationSpeed: 800
        rewindSpeed: 1000
        autoPlay: false
        stopOnHover: false
        navigation: false
        navigationText: [
          'prev'
          'next'
        ]
        rewindNav: true
        scrollPerPage: false
        pagination: true
        paginationNumbers: false
        responsive: true
        responsiveRefreshRate: 200
        responsiveBaseWidth: window
        baseClass: 'owl-carousel'
        theme: 'owl-theme'
        lazyLoad: false
        lazyFollow: true
        lazyEffect: 'fade'
        autoHeight: false
        jsonPath: false
        jsonSuccess: false
        dragBeforeAnimFinish: true
        mouseDrag: true
        touchDrag: true
        addClassActive: false
        transitionStyle: false
        beforeUpdate: false
        afterUpdate: false
        beforeInit: false
        afterInit: false
        beforeMove: false
        afterMove: false
        afterAction: false
        startDragging: false
        afterLazyLoad: false
      jQuery('[data-toggle="owl-carousel"]').each ->
        owlCarouselSettings = undefined
        owlCarouselSettingsExtras = {}
        if $(this).data('owl-carousel-settings') != ''
          owlCarouselSettingsExtras = $(this).data('owl-carousel-settings')
        owlCarouselSettings = jQuery.extend(owlCarouselSettingsDefault, owlCarouselSettingsExtras)
        $(this).owlCarousel owlCarouselSettings
        return
      return

    jQuery().themeLoadPlugin [ 'owl.carousel.js' ], [ 'owl.carousel.css' ], initOwlCarousel
  # ----------------------------------------------------------------
  # Plugin: OwlCarousel (carousel displays)
  # @see: http://owlgraphic.com/owlcarousel/
  # ----------------------------------------------------------------
  if jQuery('[data-toggle="magnific-popup"]').length > 0

    initMagnificPopup = ->
      magnificPopupSettingsDefault =
        disableOn: 0
        key: null
        midClick: false
        mainClass: ''
        preloader: true
        focus: ''
        closeOnContentClick: false
        closeOnBgClick: true
        closeBtnInside: true
        showCloseBtn: true
        enableEscapeKey: true
        modal: false
        alignTop: false
        removalDelay: 0
        prependTo: null
        fixedContentPos: 'auto'
        fixedBgPos: 'auto'
        overflowY: 'auto'
        closeMarkup: '<button title="%title%" type="button" class="mfp-close">&times;</button>'
        tClose: 'Close (Esc)'
        tLoading: 'Loading...'
        type: 'image'
      jQuery('[data-toggle="magnific-popup"]').each ->
        magnificPopupSettings = undefined
        magnificPopupSettingsExtras = {}
        if $(this).data('magnific-popup-settings') != ''
          magnificPopupSettingsExtras = $(this).data('magnific-popup-settings')
        magnificPopupSettings = jQuery.extend(magnificPopupSettingsDefault, magnificPopupSettingsExtras)
        $(this).magnificPopup magnificPopupSettings
        return
      return

    jQuery().themeLoadPlugin [ 'jquery.magnific-popup.js' ], [ 'magnific-popup.css' ], initMagnificPopup
  return
# ****************************************************************
# Custom jQuery extension functions
#
# ****************************************************************
jQuery.fn.extend
  themeSubMenus: ->
    jQuery('ul.dropdown-menu [data-toggle=dropdown]', jQuery(this)).on 'click', (event) ->
      event.preventDefault()
      event.stopPropagation()
      # Toggle direct parent
      jQuery(this).parent().toggleClass 'open'
      return
    return
  themeLoadPlugin: (js, css, callback, placement) ->
    jQuery.ajaxPrefilter 'script', (s) ->
      s.crossDomain = true
      return
    if js
      progress = 0

      internalCallback = ->
# Complete
        if ++progress == js.length
          $.each css, (index, value) ->
            jQuery('head').prepend '<link href="' + PLUGINS_PATH + value + '" rel="stylesheet" type="text/css" />'
            return
          if callback and typeof callback == 'function'
            callback()
        return

      if placement == undefined
        $.each js, (index, value) ->
          $.getScript PLUGINS_PATH + value, internalCallback
          return
      else if placement == 'append'
        $.each js, (index, value) ->
          jQuery('script[src*="bootstrap.self"]').after '<script src="' + PLUGINS_PATH + value + '"></script>'
          internalCallback()
          return
    return

