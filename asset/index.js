define([], function () {
    return {
        init: function ($mod) {
            $mod.on('tap click', '[data-href]', function (e) {
                e.preventDefault();
                console.log('clicked')
                location.href= this.getAttribute('data-href')

            });
        }
    }
})
