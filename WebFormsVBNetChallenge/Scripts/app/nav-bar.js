$(document).ready(function ($) {
    var url = window.location.href;
    var activePage = url;
    $('.nav-item a').each(function () {
        var linkPage = this.href;

        if (activePage === linkPage) {
            $(this).closest("li").addClass("active");
        }
    });
});