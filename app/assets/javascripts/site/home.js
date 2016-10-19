$(document).ready(function(){
    $('#add_to_newsletter').on('submit', function(e){
        e.preventDefault();
        var $this=$(this);
        $this.find('img').css('visibility', 'visible');

        var email=$this.find("input[name='email']").val();
        var news_id=$this.find("input[name='news_id']").val();

        var values={
            "email":email,
            "newsletter_id":news_id
        };
        $.ajax({
            url: '/home/add_to_newsletter',
            type: 'post',
            data: values,
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
            },
            success: function (data) {
                $this.find('img').css('visibility', 'hidden');
                if (data.status) {
                    $this.find("input[name='email']").val('');
                }
                $this.find('.validation p').removeClass('true').removeClass('false').addClass(data.status.toString()).find('span').html(data.message);
            }
        });
    });
});