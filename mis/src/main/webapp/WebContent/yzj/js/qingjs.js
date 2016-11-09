(function() {

    if (window.XuntongJSBridge) {
        // Android鍔犱笂浜嗚繖涓猧f鍒ゆ柇锛屽鏋滃綋鍓峸indow宸茬粡瀹氫箟浜哫untongBridge瀵硅薄锛屼笉鍐嶉噸鏂板姞杞�
        // 閬垮厤閲嶆柊鍒濆鍖朹callback_map绛夊彉閲忥紝瀵艰嚧涔嬪墠鐨勬秷鎭洖璋冨け璐ワ紝杩斿洖cb404
        //alert('window already has a XuntongBridge object!!!');
        return;
    };

    /////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////鏈湴璋冪敤鐨勫疄闄呴€昏緫////////////////////////////////////////////
    var _CUSTOM_PROTOCOL_SCHEME = 'xuntong',
        callbacksCount = 1,
        callbacks = {};

    function _handleMessageFromXT(callbackId, message) {

        try {
            var callback = callbacks[callbackId];
            if (!callback) return;
            callback.apply(null, [message]);
        } catch (e) {
            alert(e)
        }
    }

    /**
     * 鑾峰彇鐢ㄦ埛ua淇℃伅,鍒ゆ柇OS
     * @returns {string}
     */
    function getOS() {
        var userAgent = navigator.userAgent;
        return userAgent.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/) ? 'ios' : userAgent.match(/Android/i) ? 'android' : '';
    }
    /**
     * 鍒ゆ柇鐢ㄦ埛鏄惁鍦ㄤ簯涔嬪妗岄潰绔腑
     * @returns {Array|{index: number, input: string}}
     */
    function isCloudHub() {
        var userAgent = navigator.userAgent;
        return userAgent.match(/App\/cloudhub/);
    }

    // Use this in javascript to request native objective-c code
    // functionName : string (I think the name is explicit :p)
    // args : array of arguments
    // callback : function with n-arguments that is going to be called when the native code returned
    function _call(functionName, message, callback) {
        //鍙湁鍦ㄦ墜鏈烘垨鐢佃剳绔簯涔嬪涓墠鍏佽璋冪敤Xuntong JSBridge
        if ( !(getOS() || isCloudHub()) )return false;
        var hasCallback = callback && typeof callback == "function";
        var callbackId = hasCallback ? callbacksCount++ : 0;

        if (hasCallback)
            callbacks[callbackId] = callback;

        var iframe = document.createElement("IFRAME");
        iframe.setAttribute("src", _CUSTOM_PROTOCOL_SCHEME + ":" + functionName + ":" + callbackId + ":" + encodeURIComponent(JSON.stringify(message)));
        // For some reason we need to set a non-empty size for the iOS6 simulator...
        iframe.setAttribute("height", "1px");
        iframe.setAttribute("width", "1px");
        document.documentElement.appendChild(iframe);
        iframe.parentNode.removeChild(iframe);
        iframe = null;

    }




    var __XuntongJSBridge = {
        // public
        invoke: _call,
        call: _call,
        handleMessageFromXT: _handleMessageFromXT
    };

    window.XuntongJSBridge = __XuntongJSBridge;

})();/**
 * Created by admin on 2016/9/5.
 */
