$(function(){
    $body = $("body");

    function isYzjApp(){
        return navigator.userAgent.indexOf("Qing/") != -1;
    }

    function getOS(){
        return (navigator.userAgent.match(/\(i[^;]+;(U;)?CPU.+Mac OS X/)
        ?'IOS':navigator.userAgent.match(/Android/i)
        ?'android':'');
    }

    function isMobile() {
        var os = getOS();
        return os == 'ios' || os == 'android';
    }

    if(!isYzjApp()){
        $body.html("not in YzjApp!");
        if(!isMobile()){
            $body.html("not in mobile!");
        }
    }else{
        XuntongJSBridge.call('getPersonInfo',{},function(result){
            $body.html("Hello!");
        });
    }
});