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
            uniqueId: 'cashup_id',
            queryParams: function() {
                return $.extend(arguments[0], {
                    "end_date": end_date,
                    "filters": $("#filters").val(),
                    "start_date": start_date
                });
            }
        });
    });
</script>
<?= view('partial/table_filter_persistence') ?>

<?= view('partial/print_receipt', ['print_after_sale' => false, 'selected_printer' => 'takings_printer']) ?>

<style>
    #cashup_status_card {
        display:inline-flex; align-items:center; justify-content:space-between;
        min-width:280px; padding:20px 24px; border-radius:8px; margin-bottom:20px;
    }
    #cashup_status_card.status-open { background:var(--gs-accent, #40916C); color:#fff; }
    #cashup_status_card.status-closed { background:var(--gs-primary, #1B4332); color:#fff; }
    #cashup_status_card .status-text { font-size:26px; font-weight:bold; }
    #cashup_status_card .status-label { font-size:13px; opacity:0.85; margin-top:2px; }
    #cashup_status_card .status-icon { font-size:30px; opacity:0.7; }
</style>

<?php $till_status_class = !empty($till_is_open) ? 'status-open' : 'status-closed'; ?>
<div id="cashup_status_card" class="<?= $till_status_class ?>">
    <div>
        <div class="status-text"><?= !empty($till_is_open) ? 'OPEN' : 'CLOSED' ?></div>
        <div class="status-label">Till Status</div>
    </div>
    <div class="status-icon">
        <span class="glyphicon <?= !empty($till_is_open) ? 'glyphicon-lock' : 'glyphicon-lock' ?>"></span>
    </div>
</div>

<div id="title_bar" class="print_hide btn-toolbar">
    <button onclick="printdoc()" class="btn btn-info btn-sm pull-right">
        <span class="glyphicon glyphicon-print">&nbsp;</span><?= lang('Common.print') ?>
    </button>
    <button class="btn btn-info btn-sm pull-right modal-dlg" data-btn-submit="<?= lang('Common.submit') ?>" data-href="<?= "$controller_name/view" ?>" title="<?= lang(ucfirst($controller_name) . ".new") ?>">
        <span class="glyphicon glyphicon-tags">&nbsp;</span><?= lang(esc(ucfirst($controller_name)) . '.new')    // TODO: String Interpolation ?>
    </button>
</div>

<div id="toolbar">
    <div class="pull-left form-inline" role="toolbar">
        <button id="delete" class="btn btn-default btn-sm print_hide">
            <span class="glyphicon glyphicon-trash">&nbsp;</span><?= lang('Common.delete') ?>
        </button>
        <?= form_input(['name' => 'daterangepicker', 'class' => 'form-control input-sm', 'id' => 'daterangepicker']) ?>
        <?= form_multiselect('filters[]', $filters, $selected_filters ?? [], [
            'id'                        => 'filters',
            'data-none-selected-text'   => lang('Common.none_selected_text'),
            'class'                     => 'selectpicker show-menu-arrow',
            'data-selected-text-format' => 'count > 1',
            'data-style'                => 'btn-default btn-sm',
            'data-width'                => 'fit'
        ]) ?>
    </div>
</div>

<div id="table_holder">
    <table id="table"></table>
</div>

<?= view('partial/footer') ?>