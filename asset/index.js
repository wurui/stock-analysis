define([], function () {
    return {
        init: function ($mod) {
            var lastClickNode,cls='selected';
            $mod.on('tap', '[data-href]', function (e) {
                e.preventDefault();
                console.log('clicked');
                if(lastClickNode)lastClickNode.removeClass(cls);
                lastClickNode=$(this).addClass(cls);

                location.href= this.getAttribute('data-href')

            });
        }
    }
})
