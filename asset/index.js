define(['oxjs'], function (OXJS) {
    return {
        init: function ($mod) {
            //var $mod.OXModel('selected-target').on('change')
            var cls = 'selected',attr='data-symbol',
            lastSymbol=$mod.attr('data-selected');//
            
            $mod.on('tap', 'tr['+attr+']', function (e) {
                e.preventDefault();
                $mod.find('tr.'+cls).removeClass(cls);
                var symbol=$(this).addClass(cls).attr(attr);
                //1。没有的情况下要用post....

                $mod[lastSymbol?'OXPut':'OXPost']({
                    'user-select':{
                        selected:lastSymbol=symbol,
                        uid:OXJS.getUID()
                    }
                });
            }).on(OXJS.MODEL_EVENT.AFTER_WRITE,function(e,data){
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
            $(window).on('pageshow',function(){
                $mod.OXRefresh(null,function(){
                    lastSymbol=$mod.attr('data-selected')
                });


            })
            //OX.onstatechanged(checkSelect);

            //checkSelect();
        }
    }
})
