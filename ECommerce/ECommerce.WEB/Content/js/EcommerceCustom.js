function Jform(f) {
    $(f).submit(function (e) {
        e.preventDefault();
        if ($(f).valid() == true) {
            var formAction = $(this).attr("action");
            var formData = new FormData($(f)[0]);

            var btnSubmit = $(this).find("button[type='submit']");
            btnSubmit.attr("disabled", true);

            $.ajax({
                type: 'post',
                url: formAction,
                data: formData,
                processData: false,
                contentType: false
            }).done(function (result) {
                btnSubmit.removeAttr("disabled", false);
                if (result.Status === true) {
                    Swal.fire({
                        title: result.Message,
                        icon: 'success',
                        timer: 1000
                    });

                    if (result.RedirectUrl != null) {
                        setTimeout(function () {
                            window.location.href = result.RedirectUrl;
                        }, 1000);
                    }
                    else {
                        if (result.refresh == true) {
                            $(f)[0].reset();
                        }
                    }

                }
                else {
                    Swal.fire({
                        title: result.Message,
                        icon: 'error',
                    });
                }
            });
        }
        else {
            $(f).validate({ // initialize the plugin

                submitHandler: function (form) { // for demo
                    alert('valid form submitted'); // for demo
                    return false; // for demo
                }
            });
        }
    });
}

$('.datepicker').datepicker({
    dateFormat: 'dd.mm.yy',
    lang: 'tr',
    timepicker: false,
    closeOnDateSelect: true,

});


$(function () {
    $.validator.methods.date = function (value, element) {
        return this.optional(element) || moment(value, "DD.MM.YYYY", true).isValid();
    }
});

function Jform(f,c) {
    $(f).submit(function (e) {
        e.preventDefault();
        if ($(f).valid() == true) {
            var formAction = $(this).attr("action");
            var formData = new FormData($(f)[0]);

            if (c=="CK") {
                for (instance in CKEDITOR.instances) {
                    CKEDITOR.instances[instance].updateElement();
                }
            }



            var btnSubmit = $(this).find("button[type='submit']");
            btnSubmit.attr("disabled", true);

            $.ajax({
                type: 'post',
                url: formAction,
                data: formData,
                processData: false,
                contentType: false
            }).done(function (result) {
                btnSubmit.removeAttr("disabled", false);
                if (result.Status === true) {
                    Swal.fire({
                        title: result.Message,
                        icon: 'success',
                        timer: 1000
                    });

                    if (result.RedirectUrl != null) {
                        setTimeout(function () {
                            window.location.href = result.RedirectUrl;
                        }, 1000);
                    }
                    else {
                        if (result.refresh == true) {
                            $(f)[0].reset();
                        }
                    }

                }
                else {
                    Swal.fire({
                        title: result.Message,
                        icon: 'error',
                    });
                }
            });
        }
        else {
            $(f).validate({ // initialize the plugin

                submitHandler: function (form) { // for demo
                    alert('valid form submitted'); // for demo
                    return false; // for demo
                }
            });
        }
    });
}

$('.datepicker').datepicker({
    dateFormat: 'dd.mm.yy',
    lang: 'tr',
    timepicker: false,
    closeOnDateSelect: true,

});


$(function () {
    $.validator.methods.date = function (value, element) {
        return this.optional(element) || moment(value, "DD.MM.YYYY", true).isValid();
    }
});