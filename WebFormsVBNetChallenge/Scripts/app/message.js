function showMessage(message, messageType) {
    switch (messageType) {
        case 0:
            toastr.success(message, 'Success');
            break;
        case 1:
            toastr.error(message, 'Error');
            break;
    }
}