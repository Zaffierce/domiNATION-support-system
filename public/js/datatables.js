$(() => {
    $('#openTickets').DataTable({
        "order": [[0, "asc"]],
        "columnDefs": [{ targets:1, type: 'natural'}]
    });

    $('#closedTickets').DataTable({
        "order": [[5, "desc"]],
        "columnDefs": [{ targets:1, type: 'natural'}]
    });

    $('#myTickets').DataTable({
        "order": [[4, "asc"]],
        "columnDefs": [{ targets:1, type: 'natural'}]
    });
});