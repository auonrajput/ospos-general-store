<?php
/**
 * @var string $controller_name
 * @var string $table_headers
 * @var array $config
 */
?>

<?= view('partial/header') ?>

<style>
    /* Better table styling */
    #table_holder .table { margin-bottom: 0; }
    #table_holder th { font-weight: 600; text-transform: uppercase; font-size: 12px; }

    /* Modern button styling */
    #title_bar .btn-info { background: var(--gs-primary, #1B4332) !important; color: #fff !important; border: none !important; font-weight: bold; padding: 10px 20px !important; border-radius: 5px !important; }
    #title_bar .btn-info:hover { background: var(--gs-hover, #2D6A4F) !important; }

    /* Toolbar buttons */
    #toolbar .btn-default { background: var(--gs-primary, #1B4332) !important; color: #fff !important; border: 1px solid var(--gs-border, #B7D8C0) !important; margin-right: 5px; border-radius: 5px !important; }
    #toolbar .btn-default:hover { background: var(--gs-hover, #2D6A4F) !important; }

    /* Search box */
    #toolbar input[type="text"] { background: #fff !important; color: var(--gs-text, #212529) !important; border: 1px solid var(--gs-border, #B7D8C0) !important; border-radius: 5px !important; }

    /* Status badges */
    .gs-badge { color: #fff; padding: 5px 10px; border-radius: 12px; font-size: 11px; font-weight: bold; display: inline-block; }
    .gs-badge-active { background-color: var(--gs-accent, #40916C); }
    .gs-badge-inactive { background-color: #dc3545; }
</style>

<script type="text/javascript">
    $(document).ready(function() {
        <?= view('partial/bootstrap_tables_locale') ?>

        table_support.init({
            resource: '<?= esc($controller_name) ?>',
            headers: <?= $table_headers ?>,
            pageSize: <?= $config['lines_per_page'] ?>,
            uniqueId: 'people.person_id',
            enableActions: function() {
                var email_disabled = $("td input:checkbox:checked").parents("tr").find("td a[href^='mailto:']").length == 0;
                $("#email").prop('disabled', email_disabled);
            }
        });

        $("#email").click(function(event) {
            var recipients = $.map($("tr.selected a[href^='mailto:']"), function(element) {
                return $(element).attr('href').replace(/^mailto:/, '');
            });
            location.href = "mailto:" + recipients.join(",");
        });
    });
</script>

<div id="title_bar" class="btn-toolbar">
    <?php if ($controller_name === 'customers') { ?>
        <button class="btn btn-info btn-sm pull-right modal-dlg" data-btn-submit="<?= lang('Common.submit') ?>" data-href="<?= "$controller_name/csvImport" ?>" title="<?= lang(ucfirst($controller_name) . '.import_items_csv') ?>">
            <span class="glyphicon glyphicon-import">&nbsp;</span><?= lang('Common.import_csv') ?>
        </button>
    <?php } ?>
    <button class="btn btn-info btn-sm pull-right modal-dlg" data-btn-submit="<?= lang('Common.submit') ?>" data-href="<?= "$controller_name/view" ?>" title="<?= lang(ucfirst($controller_name) . '.new') ?>">
        <span class="glyphicon glyphicon-user">&nbsp;</span><?= lang(ucfirst($controller_name) . '.new') ?>
    </button>
</div>

<div id="toolbar">
    <div class="pull-left btn-toolbar">
        <button id="delete" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-trash">&nbsp;</span><?= lang('Common.delete') ?>
        </button>
        <button id="email" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-envelope">&nbsp;</span><?= lang('Common.email') ?>
        </button>
    </div>
</div>

<div id="table_holder">
    <table id="table"></table>
</div>

<script>
$(document).ready(function() {
    // Add CSV, PDF, Print, Refresh buttons
    setTimeout(function() {
        var toolbarHtml = `
            <button class="btn btn-default btn-sm" onclick="alert('CSV Export')"><span class="glyphicon glyphicon-export"></span> CSV</button>
            <button class="btn btn-default btn-sm" onclick="alert('PDF Export')"><span class="glyphicon glyphicon-file"></span> PDF</button>
            <button class="btn btn-default btn-sm" onclick="window.print()"><span class="glyphicon glyphicon-print"></span> Print</button>
            <button class="btn btn-default btn-sm" onclick="location.reload()"><span class="glyphicon glyphicon-refresh"></span> Refresh</button>
        `;
        $('#toolbar .pull-left').prepend(toolbarHtml);
    }, 500);
});
</script>

<script>
// Decode HTML entities and render badges
function decodeHTML(html) {
    var txt = document.createElement('textarea');
    txt.innerHTML = html;
    return txt.value;
}

function renderStatusBadges() {
    $('#table tbody tr').each(function() {
        var statusCell = $(this).find('td:eq(5)');
        var text = statusCell.text();
        if (text.includes('<span') && text.includes('badge')) {
            statusCell.html(decodeHTML(text));
        }
    });
}

$(document).ready(function() {
    setTimeout(renderStatusBadges, 500);
});

$(document).ajaxComplete(function(event, xhr, settings) {
    if (settings.url && settings.url.includes('getSearch')) {
        setTimeout(renderStatusBadges, 150);
    }
});
</script>

<!-- Employees status badge -->
<script>
$(document).ready(function() {
    // Fires every time the table body is rendered
    $('#table').on('post-body.bs.table', function () {
        if ('<?= esc($controller_name) ?>' === 'employees') {
            $('#table tbody tr').each(function() {
                // Status column is at index 6 (Checkbox=0, ID=1, Last=2, First=3, Email=4, Phone=5, Status=6)
                var statusCell = $(this).find('td').eq(6);
                var text = statusCell.text().trim();

                if (text == '1') {
                    statusCell.html('<span class="gs-badge gs-badge-active">ACTIVE</span>');
                } else if (text == '0') {
                    statusCell.html('<span class="gs-badge gs-badge-inactive">INACTIVE</span>');
                }
            });
        }
    });
});
</script>

<?= view('partial/footer') ?>