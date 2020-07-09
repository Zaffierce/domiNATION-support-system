$(() => {
    $('#openTickets').DataTable({
        "order": [[0, "asc"]]
    });

    $('#closedTickets').DataTable({
        "order": [[5, "desc"]]
    });

    $('#myTickets').DataTable({
        "order": [[4, "asc"]]
    });
});