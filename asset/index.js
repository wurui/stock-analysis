define(['oxjs'], function (OXJS) {
    return {
        init: function ($mod) {
            //var $mod.OXModel('selected-target').on('change')
            var cls = 'selected',attr='data-symbol',
            lastSymbol=$mod.find('tr.selected').attr(attr)
            
            $mod.on('tap', 'tr['+attr+']', function (e) {
                e.preventDefault();
                $mod.find('tr.'+cls).removeClass(cls);
                var symbol=$(this).addClass(cls).attr(attr);
                //1。没有的情况下要用post....

                $mod[lastSymbol?'OXPut':'OXPost']({
                    'user-select':{
                        selected:symbol,
                        uid:OXJS.getUID()
                    }
                });
            }).on('ox:afterModelWrite',function(e,data){
                //console.log(e,data)
                var newSymbol=data && data['user-select'] && data['user-select'].selected
                if( newSymbol !=lastSymbol){
                    lastSymbol=newSymbol;
                    $mod.OXRefresh();

                }
                if(data && data['stock-analysis']){
                    $mod.OXRefresh();
                }
                
            });
            //OX.onstatechanged(checkSelect);

            //checkSelect();
        }
    }
})
