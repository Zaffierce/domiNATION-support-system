$(() => {
    $.fn.dataTable.moment( 'M/D/YYYY, H:m:ss A' );

    $('#openTickets').DataTable({
        "order": [[0, "asc"]],
        "columnDefs": [{ targets:1, type: 'natural'}]
    });

    $('#closedTickets').DataTable({
        "order": [[0, "desc"]],
        "columnDefs": [{ targets:1, type: 'natural'}]
    });

    $('#myTickets').DataTable({
        "order": [[4, "asc"]],
        "columnDefs": [{ targets:1, type: 'natural'}]
    });
});
