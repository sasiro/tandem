
$( document ).ready(function() {
TS = {
    setup: function() {
        // add invisible 'div' to end of page:
        $('<div id="roomInfo"></div>').
            hide().
            appendTo($('#information'));
        $('a#link').click(TS.getRoomInfo);
    },
    getRoomInfo: function() {
        $.ajax({type: 'GET',
                url: $(this).attr('href'),
                timeout: 5000,
                success: TS.showRoomInfo,
                error: function() { alert('Error!'); }
               });
        return(false);
    },
    showRoomInfo: function(data) {
        // center a floater 1/2 as wide and 1/4 as tall as screen
        var oneFourth = Math.ceil($(window).width() / 4);
        $('#roomInfo').
            html(data).
            css({'left': oneFourth,  'width': 2*oneFourth, 'top': 250}).
            show();
        // make the Close link in the hidden element work
        $('#closeLink').click(TS.hideRoomInfo);
        return(false);  // prevent default link action
    },
    hideRoomInfo: function() {
        $('#roomInfo').hide();
        return(false);
    },
}
$(TS.setup);
});
