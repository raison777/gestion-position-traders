addAutocompletion = function(el, url){
    $(el).autocomplete({
        source : function(request, response) {
            jQuery.getJSON(url,
                {
                    term: $(el).val()
                }, function (data) {
                    if(data != null){
                        response(data.map(function(value) {
                            return {
                                'label': value.name,
                                'value': value.name
                            };
                        }));
                    }
                    else
                        console.log('data is null... (dev)')
                })
        }
    });
}

$(document).ready(function () {
    addAutocompletion($('.auto-trader'), "/trader/autocomplete.json");
    addAutocompletion($('.auto-action'), "/action/autocomplete.json");
});