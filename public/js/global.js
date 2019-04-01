$(function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    //切换医院
    $('.switch_item_btn').on('click',function () {
        var _that = $(this);
        var hid = parseInt(_that.attr('hid'));
        $.ajax({
            url:LA.switchHosAjaxUrl,
            type: 'POST',
            dataType:'json',
            data:{hid:hid},
            success:function (resp) {
                if (resp.ret !== 200) {
                    alert('切换失败')
                } else {
                    $('#hosValue').empty().html(_that.text() + '&nbsp;&nbsp;<span class=\"caret\"></span>');
                    _that.parent().addClass('active').siblings().removeClass('active');
                    window.location.reload();
                }
            }
        })
    })
    //高亮菜单
    var curUrl = window.location.href;

    $('.treeview-menu li a').each(function () {
        var menuUrl = $(this).attr('href');
        if (curUrl.indexOf(menuUrl)>0) {
            $(this).parent().addClass('active').parent().addClass('menu-open').show().parent().addClass('active');
        }
    })
})