// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$(document).ready(function() {

  var settings = {
               rows: gon.rows,
               cols: gon.columns,
               screen: gon.screen,
               rowCssPrefix: 'row-',
               colCssPrefix: 'col-',
               seatWidth: 35,
               seatHeight: 35,
               seatCss: 'seat',
               selectedSeatCss: 'selectedSeat',
               selectingSeatCss: 'selectingSeat'
           };

  var holder_height = settings.rows * 40;
  var holder_width = settings.cols * 40

  $("#holder").css("height", holder_height);
  $("#holder").css("width", holder_width);

  var init = function (reservedSeat) {
            
            var str = [], seatNo, className;
            for (i = 0; i < settings.rows; i++) {
              for (j = 0; j < settings.cols; j++) {
                seatNo = (i + j * settings.rows + 1);
                className = settings.seatCss + ' ' + settings.rowCssPrefix + i.toString() + ' ' + settings.colCssPrefix + j.toString();
                if ($.isArray(reservedSeat) && $.inArray(seatNo, reservedSeat) != -1) {
                  className += ' ' + settings.selectedSeatCss;
                }
                str.push('<li class="' + className + '"' +
                  'style="top:' + (i * settings.seatHeight).toString() + 'px;left:' + (j * settings.seatWidth).toString() + 'px">' +
                  '<a title="' + seatNo + '">' + seatNo + '</a>' +
                  '</li>');
              }
            }
            $('#place').html(str.join(''));

          };
    
  var bookedSeats = [5, 10, 25, 2, 3, 4];
  init(bookedSeats);

  $('.' + settings.seatCss).click(function () {
    if ($(this).hasClass(settings.selectedSeatCss)){
      alert('This seat is already reserved');
    }
    else{
      $(this).toggleClass(settings.selectingSeatCss);
    }
  })
   
  $('#btnShow').click(function () {
      var str = [];
      $.each($('#place li.' + settings.selectedSeatCss + ' a, #place li.'+ settings.selectingSeatCss + ' a'), function () {
          str.push($(this).attr('title'));
      });
      alert(str.join(','));
  })

  var seats_selected = []
  $('#btnShowNew').click(function () {
    var str = [], item;
    $.each($('#place li.' + settings.selectingSeatCss + ' a'), function () {
      item = $(this).attr('title');                   
      str.push(item);                   
    });
    alert(str.join(','));
    seats_selected = str;
  })

  $('#confirm_seats').click(function() {  
    var str = [], item;
    $.each($('#place li.' + settings.selectingSeatCss + ' a'), function () {
      item = $(this).attr('title');                   
      str.push(item);                   
    });
    console.log(str.join(","));
    $.ajax({
      type: "GET",
      url: "/seat_selects",
      data: {seats: str,
             total_rows: settings.rows,
             total_columns: settings.cols, 
             show_time: gon.showtime},
    })
  })
});
