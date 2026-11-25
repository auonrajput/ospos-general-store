<?php
/**
 * @var string $controller_name
 * @var string $table_headers
 * @var array $filters
 * @var array $selected_filters
 * @var array $config
 * @var string|null $start_date
 * @var string|null $end_date
 */
?>

<?= view('partial/header') ?>

<script type="text/javascript">
    $(document).ready(function() {
        // Load the preset datarange picker
        <?= view('partial/daterangepicker') ?>

        <?= view('partial/bootstrap_tables_locale') ?>

        // Override dates from server if provided
        <?php if (isset($start_date) && $start_date): ?>
        start_date = "<?= esc($start_date) ?>";
        <?php endif; ?>
        <?php if (isset($end_date) && $end_date): ?>
        end_date = "<?= esc($end_date) ?>";
        <?php endif; ?>

        table_support.init({
            resource: '<?= esc($controller_name) ?>',
            headers: <?= $table_headers ?>,
            pageSize: <?= $config['lines_per_page'] ?>,
            uniqueId: 'expense_id',
            onLoadSuccess: function(response) {
                if ($("#table tbody tr").length > 1) {
                    $("#payment_summary").html(response.payment_summary);
                    $("#table tbody tr:last td:first").html("");
                    $("#table tbody tr:last").css('font-weight', 'bold');
                }
                if (typeof response.total_amount !== 'undefined') {
                    $('#expenses_total_amount').text('<?= esc($config['currency_symbol']) ?>' + parseFloat(response.total_amount).toFixed(2));
                }
                if (typeof response.entries_count !== 'undefined') {
                    $('#expenses_entries_count').text(response.entries_count);
                }
            },
            queryParams: function() {
                return $.extend(arguments[0], {
                    "start_date": start_date,
                    "end_date": end_date,
                    "filters": $("#filters").val()
                });
            }
        });

    });
</script>
<?= view('partial/table_filter_persistence') ?>

<?= view('partial/print_receipt', ['print_after_sale' => false, 'selected_printer' => 'takings_printer']) ?>

<div id="title_bar" class="print_hide btn-toolbar">
    <button onclick="printdoc()" class="btn btn-info btn-sm pull-right">
        <span class="glyphicon glyphicon-print">&nbsp;</span><?= lang('Common.print') ?>
    </button>
    <button class="btn btn-info btn-sm pull-right modal-dlg" data-btn-submit="<?= lang('Common.submit') ?>" data-href="<?= "$controller_name/view" ?>" title="<?= lang(ucfirst($controller_name) . '.new') ?>">
        <span class="glyphicon glyphicon-tags">&nbsp;</span><?= lang(ucfirst($controller_name) . '.new') ?>
    </button>
</div>

<div id="toolbar">
    <div class="pull-left form-inline" role="toolbar">
        <button id="delete" class="btn btn-default btn-sm print_hide">
            <span class="glyphicon glyphicon-trash">&nbsp;</span><?= lang('Common.delete') ?>
        </button>
        <?= form_input(['name' => 'daterangepicker', 'class' => 'form-control input-sm', 'id' => 'daterangepicker']) ?>
        <?= form_multiselect('filters[]', esc($filters), $selected_filters ?? [], [
            'id'                        => 'filters',
            'data-none-selected-text'   => lang('Common.none_selected_text'),
            'class'                     => 'selectpicker show-menu-arrow',
            'data-selected-text-format' => 'count > 1',
            'data-style'                => 'btn-default btn-sm',
            'data-width'                => 'fit'
        ]) ?>
    </div>
</div>

<style>
    #expenses_summary_cards { display:flex; gap:15px; margin-bottom:20px; }
    .expenses-summary-card { border-radius:8px; padding:18px 24px; display:flex; align-items:center; justify-content:space-between; min-width:220px; }
    .expenses-summary-card.total { background:var(--gs-primary, #1B4332); color:#fff; }
    .expenses-summary-card.entries { background:var(--gs-light, #E8F3E9); border:1px solid var(--gs-border, #B7D8C0); color:#1B4332 !important; }
    .expenses-summary-card.entries .label,
    .expenses-summary-card.entries .value { color:#1B4332 !important; }
    .expenses-summary-card .value { font-size:26px; font-weight:bold; }
    .expenses-summary-card .label { font-size:13px; opacity:0.85; margin-top:4px; }
    .expenses-summary-card .icon { font-size:28px; opacity:0.6; }
</style>
<div id="expenses_summary_cards">
    <div class="expenses-summary-card total">
        <div>
            <div class="value" id="expenses_total_amount"><?= esc($config['currency_symbol']) ?>0.00</div>
            <div class="label">Total Expenses</div>
        </div>
        <div class="icon">&#128176;</div>
    </div>
    <div class="expenses-summary-card entries">
        <div class="icon" style="margin-right:12px;">&#128203;</div>
        <div>
            <div class="label" style="margin-top:0;">ENTRIES</div>
            <div class="value" id="expenses_entries_count">0</div>
        </div>
    </div>
</div>

<div id="table_holder">
    <table id="table"></table>
</div>

<div id="payment_summary"></div>

<?= view('partial/footer') ?>