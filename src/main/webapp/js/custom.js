(function ($) {
  "use strict";
  var review = $('.client_review_slider');
  if (review.length) {
    review.owlCarousel({
      items: 3,
      loop: true,
      dots: false,
      autoplay: true,
      margin: 40,
      autoplayHoverPause: true,
      autoplayTimeout: 5000,
      nav: true,
      navText: [
        '<i class="ti-angle-left"></i>',
        '<i class="ti-angle-right"></i>'
      ],
      responsive: {
        0: {
          items: 1,
          nav: false
        },
        576: {
          items: 2,
          nav: false
        },
        768: {
          items: 2,
          nav: false
        },
        991: {
          items: 3,
          nav: true
        }
      }
    });
  }
  var event = $('.event_slider');
  if (event.length) {
    event.owlCarousel({
      items: 1,
      loop: true,
      dots: false,
      autoplay: true,
      margin: 40,
      autoplayHoverPause: true,
      autoplayTimeout: 5000,
      nav: true,
      navText: [
        '<i class="ti-angle-left"></i>',
        '<i class="ti-angle-right"></i>'
      ],
      responsive: {
        0: {
          nav: false
        },
        600: {
          nav: false
        },
        991: {
          nav: true
        }
      }
    });
  }
  
  var nc_select = $('.nc_select');
  if(nc_select.length){
    nc_select.niceSelect();
  }
  
   $('.datepicker').each(function(){
	  $(this).datepicker({
	   icons: {
	              rightIcon: '<i class="material-icons">date_range</i>'
	         }
	   ,uiLibrary: "bootstrap4"
	   ,keyboardNavigation: true
	   ,locale: 'ko-kr'
	   ,header: true
	         ,modal:false
	         ,footer:false
	         ,calendarWeeks:false
	         ,format: "yyyy-mm-dd"
  		});
	});

  // datepicker 초기화
  let today = new Date();
  $("#datepicker_1").datepicker({
      dateFormat: 'yyyy-mm-dd',
      showOtherMonths: true,
      showMonthAfterYear: true,
      changeYear: true,
      changeMonth: true,
      showOn: "both",
      buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
      buttonImageOnly: true,
      buttonText: "선택",
      yearSuffix: "년",
      monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
      monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
      dayNamesMin: ['일','월','화','수','목','금','토'],
      dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
      minDate: today // 오늘 날짜 이전을 비활성화
/*      onSelect: function(dateText, inst) {
        var date = $(this).datepicker('getDate');
        date.setDate(date.getDate() + 1);
        $("#datepicker_2").datepicker("option", "minDate", date);
      }*/
  });
  $("#datepicker_2").datepicker({
      dateFormat: 'yyyy-mm-dd',
      showOtherMonths: true,
      showMonthAfterYear: true,
      changeYear: true,
      changeMonth: true,
      minDate: today
/*      beforeShow: function(input, inst) {
        var date = $("#datepicker_1").datepicker('getDate');
        if (date) {
          date.setDate(date.getDate() + 1);
          $(this).datepicker('option', 'minDate', date);
        }
      }*/
  });

  // 기본 날짜 설정
 /* $('#datepicker_1').datepicker("placeholder", "Check in");
  $('#datepicker_2').datepicker("placeholder", "Check out");*/

  $('.gallery_img').magnificPopup({
    type: 'image',
    gallery:{
      enabled:true
    }
  });

  $('.gallery_img').magnificPopup({
    type: 'image',
    gallery:{
      enabled:true
    }
  });

  $('.popup-youtube, .popup-vimeo').magnificPopup({
    // disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 160,
    preloader: false,
    fixedContentPos: false
  });

  // menu fixed js code
  $(window).scroll(function () {
    var window_top = $(window).scrollTop() + 1;
    if (window_top > 50) {
      $('.main_menu_iner').addClass('menu_fixed animated fadeInDown');
    } else {
      $('.main_menu_iner').removeClass('menu_fixed animated fadeInDown');
    }
  });

}(jQuery));