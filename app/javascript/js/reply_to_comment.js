document.addEventListener('turbolinks:load', function () {
    if ( window.location.pathname.includes("posts")) {
        $(document).ready(function() {
            $('.form-reply-show').hide();
            $('.reply').click(function() {
                $(this).closest('.reply-wrap').children('.form-reply-show').show(500);
            });
        });
    }
});
