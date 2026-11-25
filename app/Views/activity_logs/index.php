<?= view('partial/header') ?>
<style>
    .al-toolbar { display:flex; gap:15px; flex-wrap:wrap; align-items:flex-end; margin-bottom:15px; }
    .al-toolbar .form-group { margin-bottom:0; }
    .al-toolbar label { display:block; font-size:12px; color:var(--panel-text-muted); margin-bottom:4px; }
    .al-toolbar select, .al-toolbar input { min-width:160px; }
    #al_table th, #al_table td { font-size:13px; }
    .al-action-badge { display:inline-block; padding:3px 10px; border-radius:10px; font-size:11px; font-weight:bold; color:var(--panel-text); background:#3498db; }
    .al-action-badge.login_failed { background:#c0392b; }
    .al-action-badge.login { background:#27ae60; }
</style>

<div id="title_bar" class="btn-toolbar">
    <button id="al_clear_btn" class="btn btn-default btn-sm pull-right">
        <span class="glyphicon glyphicon-trash">&nbsp;</span>Clear Logs
    </button>
</div>

<div class="al-toolbar">
    <div class="form-group">
        <label>Action</label>
        <select id="al_filter_action" class="form-control input-sm">
            <option value="">All Actions</option>
        </select>
    </div>
    <div class="form-group">
        <label>User</label>
        <select id="al_filter_user" class="form-control input-sm">
            <option value="">All Users</option>
        </select>
    </div>
    <div class="form-group">
        <label>From</label>
        <input type="date" id="al_filter_from" class="form-control input-sm">
    </div>
    <div class="form-group">
        <label>To</label>
        <input type="date" id="al_filter_to" class="form-control input-sm">
    </div>
    <div class="form-group">
        <label>Search</label>
        <input type="text" id="al_filter_search" class="form-control input-sm" placeholder="Search...">
    </div>
</div>

<table id="al_table" class="table table-striped">
    <thead>
        <tr>
            <th>When</th>
            <th>User</th>
            <th>Action</th>
            <th>Table</th>
            <th>Ref ID</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody id="al_table_body">
        <tr><td colspan="6" style="text-align:center; color:var(--panel-text-muted);">Loading...</td></tr>
    </tbody>
</table>

<script>
$(document).ready(function() {
    function loadFilters() {
        $.getJSON("<?= site_url('activity_logs/filters') ?>", function(data) {
            var $actionSel = $('#al_filter_action');
            data.actions.forEach(function(a) {
                $actionSel.append('<option value="' + a + '">' + a + '</option>');
            });
            var $userSel = $('#al_filter_user');
            data.users.forEach(function(u) {
                if (u) $userSel.append('<option value="' + u + '">' + u + '</option>');
            });
        });
    }

    function loadLogs() {
        var params = {
            action: $('#al_filter_action').val(),
            user: $('#al_filter_user').val(),
            from: $('#al_filter_from').val(),
            to: $('#al_filter_to').val(),
            search: $('#al_filter_search').val()
        };
        $.getJSON("<?= site_url('activity_logs/search') ?>", params, function(data) {
            var html = '';
            if (data.rows.length === 0) {
                html = '<tr><td colspan="6" style="text-align:center; color:var(--panel-text-muted);">No logs found</td></tr>';
            } else {
                data.rows.forEach(function(row) {
                    html += '<tr>';
                    html += '<td>' + row.log_time + '</td>';
                    html += '<td>' + (row.user_name || '-') + '</td>';
                    html += '<td><span class="al-action-badge ' + row.action + '">' + row.action + '</span></td>';
                    html += '<td>' + (row.table_name || '-') + '</td>';
                    html += '<td>' + (row.ref_id || '-') + '</td>';
                    html += '<td>' + (row.description || '-') + '</td>';
                    html += '</tr>';
                });
            }
            $('#al_table_body').html(html);
        });
    }

    $('#al_filter_action, #al_filter_user, #al_filter_from, #al_filter_to').change(loadLogs);
    var search_timer = null;
    $('#al_filter_search').on('keyup', function() {
        clearTimeout(search_timer);
        search_timer = setTimeout(loadLogs, 400);
    });

    $('#al_clear_btn').click(function() {
        if (confirm('Clear all activity logs? This cannot be undone.')) {
            $.post("<?= site_url('activity_logs/clear') ?>", function() {
                loadLogs();
            });
        }
    });

    loadFilters();
    loadLogs();
});
</script>
<?= view('partial/footer') ?>
