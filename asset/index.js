define(['oxjs'], function (OX) {
    return {
        init: function ($mod) {
            var lastFocusNode, cls = 'selected';
            var qs = $mod.attr('data-qs'),
                param = {},
                checkSelect = function () {
                    if (lastFocusNode)lastFocusNode.removeClass(cls);
                    var symbol=OX.queryString(qs);//console.log(symbol)
                    if(symbol) {
                        lastFocusNode=$mod.find('tr[data-href="'+symbol+'"]').addClass(cls);
                    }
                };
            $mod.on('tap', '[data-href]', function (e) {
                e.preventDefault();
                //console.log('clicked');
                /*
                if (lastFocusNode)lastFocusNode.removeClass(cls);
                lastFocusNode = $(this).addClass(cls);
                */

                param[qs] = this.getAttribute('data-href');

                OX.changeState(param)

                //location.href = this.getAttribute('data-href')
            });
            OX.onstatechanged(checkSelect);

            checkSelect();
        }
    }
})
