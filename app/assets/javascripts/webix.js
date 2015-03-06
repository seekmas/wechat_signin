webix.protoUI({
    name:"menulist",
    defaults:{
        css:"menu",
        select: true,
        type:{
            height: 'auto'
        }
    },
    type:
    {
        templateStart: function(obj, common, marks)
        {
            return "<div>";
        },

        template: function(obj, common, marks)
        {
            if('header' in obj)
            {
                return "<div class='menu-header'>"+obj.text+"</div>";
            }else if('footer' in obj)
            {
                return "<div class='menu-footer'>"+obj.text+"</div>";
            }else{

                return '<div class="menu-'+obj.color+'" webix_l_id="'+obj.id+'">'+obj.text+'<span class="put-right">'+common.itemIcon+'</span></div>';
            }
        },

        templateEnd: function(obj, common, marks)
        {
            return "</div>";
        },

        itemIcon:"<i class='fa fa-plus-square-o'></i>"
    }
}, webix.ui.list);


