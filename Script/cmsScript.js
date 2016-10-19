//main menu
function onloadmenu() {
    $('.subcatholderclass').css('height', '0px');
    didsel = '';
    Alldivs = document.getElementsByTagName('div');
    for (i = 0; i < Alldivs.length; i++) {
        if (Alldivs[i].className == 'topselLinkholderclass') {
            didsel = Alldivs[i].id;
        }
    }
}
function menumouseover(selected) {
    if (didsel != '') {
        document.getElementById(didsel).className = 'topLinkholderclass';
    }
    //alert($(selected).attr('id'));
    document.getElementById(selected.id).className = 'topselLinkholderclass';
    $(selected).children('.subcatholderclass').css('height', '100%');
    $(selected).children('.subcatholderclass').css('overflow', 'visible');
}
function menumouseOut(selected) {
    document.getElementById(selected.id).className = 'topLinkholderclass';
    if (didsel != '') {
        document.getElementById(didsel).className = 'topselLinkholderclass';
    }
    $('.subcatholderclass').css('height', '0px');
    $('.subcatholderclass').css('overflow', 'hidden');
}
//main menu 

function CloseFrom() {
    //window.parent.$('.RemoveBlockAlert2').css('display', 'none');
    parent.window.$('#ajaxid').css('display', 'none');
    parent.window.$('.RemoveBlockAlert').css('display', 'none');
    parent.window.$('.RemoveBlockAlert2').css('display', 'none');
    parent.window.$('.mainiframeclass').css('display', 'none');
    parent.window.$('.RemoveBlockAlert').css('display', 'none');
    parent.window.$('.mainiframeclass').attr('src', '');
    //parent.window.location.href = parent.window.location.pathname; ; 
  
}

function openMyprofile(mylink, width, height) {
    $('.mainiframeclass').attr('width', '0px');
    $('.mainiframeclass').attr('height',  '0px');
    $('#ajaxid').css('display', 'block');
     $('.RemoveBlockAlert2').css('display', 'block');
     $('.mainiframeclass').css('display', 'block');
    $('.mainiframeclass').attr('src', mylink);
    $('.RemoveBlockAlert').css('display', 'block');
    $('.iframholder11').css('display', 'block');
    $('.iframholder22').css('display', 'block');     
    $('.iframholder11').css('top', '120px');
    $('.iframholder11').draggable({ handle: $('bbb') });
}



//images js

// fix image size set onload
function setimgpos(sender) {
    //$(sender).parent().css('background-color', '#000000');
    $(sender).css('height', 'initial');
    $(sender).css('width', 'initial');
    $(sender).css('margin-left', '0px');
    $(sender).css('margin-top', '0px');
    var x = 0;
    if ($(sender).width() * 1000 / $(sender).parent().width() > $(sender).height() * 1000 / $(sender).parent().height()) {
        $(sender).css('height', $(sender).parent().height() + 'px');

        x = ($(sender).width() - $(sender).parent().width()) / 2;
        $(sender).css('margin-left', '-' + x + 'px');

    } else {

        $(sender).css('width', $(sender).parent().width() + 'px');
        x = ($(sender).height() - $(sender).width()) / 2;
        $(sender).css('margin-top', '-' + x + 'px');
    }
  
}
function setimgposnew(sender, newx, newy) {

    $(sender).parent().css('direction', 'ltr');
    $(sender).css('height', 'initial');
    $(sender).css('width', 'initial');
    $(sender).css('margin-left', '0px');
    $(sender).css('margin-top', '0px');
    var x = 0;
    if ($(sender).width() * 1000 / $(sender).parent().width() > $(sender).height() * 1000 / $(sender).parent().height()) {
        $(sender).css('height', $(sender).parent().height() + 'px');
        x = ($(sender).width() - $(sender).parent().width()) / 2;
        newx = (($(sender).parent().width() * 1000 / 410) * newx) / 1000;
        $(sender).css('margin-left', '-' + (x - newx) + 'px');
    } else {
        $(sender).css('width', $(sender).parent().width() + 'px');
        x = ($(sender).height() - $(sender).width()) / 2;
        newy = (($(sender).parent().height() * 1000 / 410) * newy) / 1000;
        $(sender).css('margin-top', '-' + (x - newy) + 'px');
    }
}
function setimgposnew2(sender, newx, newy) {    
  
    $(sender).parent().css('direction', 'ltr');
    $(sender).css('height', 'initial');
    $(sender).css('width', 'initial');
    $(sender).css('margin-left', '0px');
    $(sender).css('margin-top', '0px');
    var x = 0;
    
   
    if ($.browser.msie) {
        console.log('aaaa'+$(sender).attr('id') + ' ' + newx + ' ' + newy);
        var img = document.getElementById($(sender).attr('id'));
        var screenImage = $(sender);
        // Create new offscreen image to test
        var theImage = new Image();
        theImage.src = screenImage.attr("src");       
        setTimeout(function () {
            var imageWidth = theImage.width;
            var imageHeight = theImage.height;

            if ($(sender).width() * 1000 / $(sender).parent().width() > $(sender).height() * 1000 / $(sender).parent().height()) {
                $(sender).css('height', $(sender).parent().height() + 'px');
                $(sender).css('width', imageWidth + 'px');
                x = ($(sender).width() - $(sender).parent().width()) / 2;
                newx = (($(sender).parent().width() * 1000 / 410) * newx) / 1000;
                $(sender).css('margin-left', '-' + (x - newx) + 'px');
            } else {
                $(sender).css('width', $(sender).parent().width() + 'px');
                $(sender).css('height', imageHeight + 'px');               
                x = ($(sender).height() - $(sender).width()) / 2;
                newy = (($(sender).parent().height() * 1000 / 410) * newy) / 1000;
                $(sender).css('margin-top', '-' + (x - newy) + 'px');
            }            
        }, 20);
    } else {     
        if ($(sender).width() * 1000 / $(sender).parent().width() > $(sender).height() * 1000 / $(sender).parent().height()) {
            $(sender).css('height', $(sender).parent().height() + 'px');      
            x = ($(sender).width() - $(sender).parent().width()) / 2;
            newx = (($(sender).parent().width() * 1000 / 410) * newx) / 1000;       
            $(sender).css('margin-left', '-' + (x-newx) + 'px');
        } else {
            $(sender).css('width', $(sender).parent().width() + 'px');
            x = ($(sender).height() - $(sender).width()) / 2;
            newy = (($(sender).parent().height() * 1000 / 410) * newy) / 1000;       
            $(sender).css('margin-top', '-' + (x-newy) + 'px');
        }
    }
}




// HTML EVENT HOME PAGE
function greet(event) {
    if ($('#' + event.data.dotogle).val() == "true" && $('#' + event.data.dropid).css('display') != 'none') {
        $('#' + event.data.dropid).css('display', 'none');
        $('#' + event.data.dropid).prev().removeClass('UperBlockText2');
      
    } else {
        $('#' + event.data.dotogle).val('true');
    }
}




// JAVASCRIPT EVENT REGISTER PAGE
function checkstate(myvalue) {
    if (myvalue == 230) {
        $('.MyDropDownClass').each(function (i) {
            if ($(this).attr('id').indexOf('State') > 0) {
                $(this).attr('disabled', false);
                $(this).prev().prev().prev().css('color', '#333333');
            }
        });
    }
    else {
        $('.MyDropDownClass').each(function (i) {
            if ($(this).attr('id').indexOf('State') > 0) {
                $(this).prev().prev().prev().css('color', '#999999');
                $(this).attr('disabled', true);
            }
        });
    }
}
// JAVASCRIPT SCROLLER

function mCustomScrollbars() {
    $("#mcs_container").mCustomScrollbar("vertical", 200, "easeOutCirc", 1.25, "fixed", "yes", "no", 0);
}

// Play movie on default page

function playmovie(movieurl) {
    if (x == 3) {
        $(".movieimageclass").html(' <img id="movieimg" style="position:absolute;z-index:20;top:0px;left:3px;" src="images/SiteImages/homefilmimg.png" />');
        x = 2;
             
        $('.playvideoclass').css('background-image', 'none');
    } else {
        $(".movieimageclass").html("<iframe  width='680' height='360' src='" + movieurl + "' frameborder='0' allowfullscreen wmode='Opaque'></iframe>");
        x = 3;
        $('.movieframclass ').css('position', 'static');
        $('.movieframclass2').css('display', 'none');
        $('.movieframclass').css('display', 'none');
        $('.playvideoclass').css('background-image', 'url(Images/SiteImages/stopimg.png)');
    }

}
function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
function getsound(number) {
   
        var sound2 = $('<embed autoplay="true" height="0" width="0" />');
        switch (number) {
            case 1:
                sound2.attr('src', 'images/music/conversation_end.mp3');
                break;
            case 2:
                sound2.attr('src', 'images/music/add_alert.mp3');
                break;
            case 3:
                sound2.attr('src', 'images/music/incoming_call.mp3');
                break;
            case 4:
                sound2.attr('src', 'images/music/new_message.mp3');
                break;
             case 5:
                 sound2.attr('src', 'images/music/new_contact.mp3');
                break;
            default:
        }
        if (sound == 1) {
            $('body').append(sound2);
        }
}
function alertajaxerror(msg, name) {
   //  alert('function  ' + name + ' ERROR!!!! #' + msg.status + ' :' + msg.statusText + ' :' );
}
function checksessionok(text,type)
{
  
    if (text == '1error1')
    {
       // alert('aaaa');
        if (type == 1) {
            onbeforeunload = null;
            window.location = './';
        } else if (type == 2) {
            $(".mainiframeclass")[0].contentWindow.onbeforeunload = null;
            onbeforeunload = null;
            parent.window.location.href = './';
           
        }
    }
}


function replacequote(text) {
    var newText = "";
    for (var i = 0; i < text.length; i++) {
        if (text[i] == "'") {
            newText += "\\'";
        }
        else
            newText += text[i];
    }
    return newText;
};




function  keyupdirection(sender) {
   
    $this = $(sender);
   
    if ($this.val().length >1) {
        var x = new RegExp("[\x00-\x80]+"); // is ascii
       
       //alert(x.test($this.val()));

        var isAscii = x.test($this.val()[0] + $this.val()[1]);

        if (isAscii) {
            $this.css("direction", "ltr");
        }
        else {
            $this.css("direction", "rtl");
        }
    }

};

