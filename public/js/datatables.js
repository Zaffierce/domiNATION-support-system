

$(() => {
    
    $.fn.dataTable.moment('MM/DD/YYYY HH:mm');

    $('#myTickets').DataTable({
        "order": [[4, "asc"]],
        "columnDefs": [{ targets:1, type: 'natural'}]
    });
});
