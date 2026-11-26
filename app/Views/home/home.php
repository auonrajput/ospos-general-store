<?php
/**
 * @var array $allowed_modules
 * @var array $dashboard
 */
?>

<?= view('partial/header') ?>

<script type="text/javascript">
    dialog_support.init("a.modal-dlg");
</script>

<style>
    :root {
        --gs-primary: #1B4332;
        --gs-success: #2D6A4F;
        --gs-warning: #d97706;
        --gs-danger: #dc2626;
        --gs-text: #1B4332;
        --gs-muted: #456B57;
        --gs-border: #B7D7C2;
        --gs-bg: #EAF4EC;
    }

    .gs-dashboard {
        max-width: 1500px;
        margin: 0 auto;
        padding: 20px 24px 35px;
        color: var(--gs-text);
    }

    .gs-heading {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 12px;
        margin-bottom: 25px;
    }

    .gs-heading h2 {
        margin: 0 0 6px;
        font-size: 25px;
        font-weight: 700;
        color: var(--gs-text);
    }

    .gs-heading p {
        margin: 0;
        color: var(--gs-muted);
        font-size: 13px;
    }

    .gs-heading-icon {
        width: 48px;
        height: 48px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #DCEFE1;
        color: var(--gs-primary);
        border-radius: 13px;
        font-size: 21px;
    }

    #dashboard_widgets {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 18px;
    }

    .gs-card {
        position: relative;
        z-index: 1;
        min-height: 145px;
        padding: 20px;
        background: #E8F3E9;
        border: 1px solid var(--gs-border);
        border-radius: 13px;
        box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
        transition: transform .2s ease, box-shadow .2s ease;
        overflow: visible;
    }

    .gs-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 22px rgba(15, 23, 42, 0.08);
    }

    /* Card with an open dropdown must stay above the cards after it */
    .gs-card.gs-dropdown-open {
        z-index: 50;
    }

    .gs-card-top {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 10px;
        margin-bottom: 17px;
    }

    .gs-card-icon {
        width: 42px;
        height: 42px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 11px;
        font-size: 18px;
    }

    .gs-blue .gs-card-icon {
        background: #DCEFE1;
        color: #1B4332;
    }

    .gs-green .gs-card-icon {
        background: #D5EAD9;
        color: #2D6A4F;
    }

    .gs-orange .gs-card-icon {
        background: #E5F0D8;
        color: #d97706;
    }

    .gs-red .gs-card-icon {
        background: #F4E5E2;
        color: #dc2626;
    }

    .gs-purple .gs-card-icon {
        background: #E6EFE7;
        color: #315C43;
    }

    .gs-card .dash-value {
        font-size: 27px;
        line-height: 1.25;
        font-weight: 750;
        color: var(--gs-text);
        overflow-wrap: anywhere;
    }

    .gs-card .dash-label {
        margin-top: 7px;
        color: var(--gs-muted);
        font-size: 12px;
        font-weight: 600;
        letter-spacing: .35px;
        text-transform: uppercase;
    }

    .gs-card .dash-label .gs-subtext {
        display: block;
        margin-top: 4px;
        font-size: 11px;
        font-weight: 400;
        text-transform: none;
        letter-spacing: 0;
    }

    .gs-card .dropdown {
        position: relative;
    }

    .gs-filter-btn {
        width: 31px;
        height: 31px;
        padding: 0;
        border: 1px solid var(--gs-border);
        border-radius: 8px;
        background: #E8F3E9;
        color: var(--gs-muted);
    }

    .gs-filter-btn:hover,
    .gs-filter-btn:focus {
        background: var(--gs-bg);
        color: var(--gs-primary);
    }

    .gs-card .dropdown-menu {
        min-width: 145px;
        padding: 5px;
        border: 1px solid var(--gs-border);
        border-radius: 9px;
        box-shadow: 0 8px 20px rgba(15, 23, 42, .12);
    }

    .gs-card .dropdown-menu li a {
        padding: 8px 11px;
        border-radius: 6px;
        font-size: 12px;
    }

    .gs-card .dropdown-menu li a:hover {
        background: #DCEFE1;
        color: var(--gs-primary);
    }

    .gs-section-title {
        margin: 28px 0 13px;
        font-size: 15px;
        font-weight: 700;
        color: var(--gs-text);
    }

    /* ===== Tables Section ===== */
    .gs-tables-section {
        margin-top: 32px;
    }

    .gs-tables-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 18px;
        margin-top: 18px;
    }

    .gs-table-card {
        background: #E8F3E9;
        border: 1px solid var(--gs-border);
        border-radius: 13px;
        padding: 18px 20px;
        box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
    }

    .gs-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 13px;
    }

    .gs-table thead th {
        text-align: left;
        padding: 10px 12px;
        color: var(--gs-muted);
        font-weight: 600;
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 0.4px;
        border-bottom: 2px solid var(--gs-border);
    }

    .gs-table tbody td {
        padding: 11px 12px;
        border-bottom: 1px solid #D5E8D9;
        color: var(--gs-text);
    }

    .gs-table tbody tr:last-child td {
        border-bottom: none;
    }

    .gs-table tbody tr:hover {
        background: #DCEFE1;
    }

    .gs-badge {
        display: inline-block;
        padding: 3px 10px;
        border-radius: 12px;
        font-size: 11px;
        font-weight: 600;
    }

    .gs-badge-green {
        background: #D5EAD9;
        color: #2D6A4F;
    }

    .gs-unit-tag {
        display: inline-block;
        margin-left: 6px;
        padding: 2px 8px;
        background: #DCEFE1;
        color: var(--gs-muted);
        border-radius: 10px;
        font-size: 10px;
        font-weight: 600;
    }

    .gs-stock-warn {
        color: #dc2626;
        font-weight: 700;
    }

    .gs-empty-state {
        padding: 24px 12px;
        text-align: center;
        color: var(--gs-muted);
        font-size: 13px;
    }

    @media (max-width: 991px) {
        #dashboard_widgets {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }

        .gs-tables-grid {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 575px) {
        .gs-dashboard {
            padding: 6px 8px 12px;
        }

        .gs-heading h2 {
            font-size: 21px;
        }

        #dashboard_widgets {
            grid-template-columns: 1fr;
            gap: 12px;
        }

        .gs-card {
            min-height: 105px;
            padding: 12px;
        }

        .gs-card .dash-value {
            font-size: 25px;
        }

        .gs-table {
            font-size: 12px;
        }

        .gs-table thead th,
        .gs-table tbody td {
            padding: 8px 8px;
        }
    }
</style>

<div class="gs-dashboard">

    <div class="gs-heading">
        <div>
            <h2>
                <i class="glyphicon glyphicon-dashboard"></i>
                General Store Dashboard
            </h2>
            <p>Business overview and daily performance</p>
        </div>

        <div class="gs-heading-icon">
            <i class="glyphicon glyphicon-shopping-cart"></i>
        </div>
    </div>

    <div id="dashboard_widgets">

        <!-- Today's Sales -->
        <div class="gs-card gs-green">
            <div class="gs-card-top">
                <div class="gs-card-icon">
                    <i class="glyphicon glyphicon-shopping-cart"></i>
                </div>

                <div class="dropdown">
                    <button class="gs-filter-btn dropdown-toggle"
                            type="button"
                            data-toggle="dropdown"
                            title="Filter sales by date">
                        <i class="glyphicon glyphicon-calendar"></i>
                    </button>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="#" data-value="today">Today</a></li>
                        <li><a href="#" data-value="yesterday">Yesterday</a></li>
                        <li><a href="#" data-value="last_7_days">Last 7 Days</a></li>
                        <li><a href="#" data-value="this_month">This Month</a></li>
                        <li><a href="#" data-value="all_time">All Time</a></li>
                    </ul>
                </div>
            </div>

            <div class="dash-value">
                <?= to_currency($dashboard['today_sales_total']) ?>
            </div>

            <div class="dash-label">
                Today's Sales
                <span class="gs-subtext">
                    <?= (int) $dashboard['today_sales_count'] ?> transactions
                </span>
            </div>
        </div>

        <!-- Low Stock -->
        <div class="gs-card gs-orange">
            <div class="gs-card-top">
                <div class="gs-card-icon">
                    <i class="glyphicon glyphicon-alert"></i>
                </div>
            </div>

            <div class="dash-value">
                <?= (int) $dashboard['low_stock_count'] ?>
            </div>

            <div class="dash-label">Low Stock Items</div>
        </div>

        <!-- Today's Net Profit -->
        <div class="gs-card <?= $dashboard['today_profit'] >= 0 ? 'gs-blue' : 'gs-red' ?>">
            <div class="gs-card-top">
                <div class="gs-card-icon">
                    <i class="glyphicon glyphicon-stats"></i>
                </div>

                <div class="dropdown">
                    <button class="gs-filter-btn dropdown-toggle"
                            type="button"
                            data-toggle="dropdown"
                            title="Filter profit by date">
                        <i class="glyphicon glyphicon-calendar"></i>
                    </button>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="#" data-value="today">Today</a></li>
                        <li><a href="#" data-value="yesterday">Yesterday</a></li>
                        <li><a href="#" data-value="last_7_days">Last 7 Days</a></li>
                        <li><a href="#" data-value="this_month">This Month</a></li>
                        <li><a href="#" data-value="all_time">All Time</a></li>
                    </ul>
                </div>
            </div>

            <div class="dash-value">
                <?= to_currency($dashboard['today_profit']) ?>
            </div>

            <div class="dash-label">Today's Net Profit</div>
        </div>

        <!-- Today's Income -->
        <div class="gs-card gs-green">
            <div class="gs-card-top">
                <div class="gs-card-icon">
                    <i class="glyphicon glyphicon-download-alt"></i>
                </div>

                <div class="dropdown">
                    <button class="gs-filter-btn dropdown-toggle"
                            type="button"
                            data-toggle="dropdown"
                            title="Filter income by date">
                        <i class="glyphicon glyphicon-calendar"></i>
                    </button>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="#" data-value="today">Today</a></li>
                        <li><a href="#" data-value="yesterday">Yesterday</a></li>
                        <li><a href="#" data-value="last_7_days">Last 7 Days</a></li>
                        <li><a href="#" data-value="this_month">This Month</a></li>
                        <li><a href="#" data-value="all_time">All Time</a></li>
                    </ul>
                </div>
            </div>

            <div class="dash-value">
                <?= to_currency($dashboard['today_income']) ?>
            </div>

            <div class="dash-label">Today's Income</div>
        </div>

        <!-- Today's Expenses -->
        <div class="gs-card gs-red">
            <div class="gs-card-top">
                <div class="gs-card-icon">
                    <i class="glyphicon glyphicon-upload"></i>
                </div>

                <div class="dropdown">
                    <button class="gs-filter-btn dropdown-toggle"
                            type="button"
                            data-toggle="dropdown"
                            title="Filter expenses by date">
                        <i class="glyphicon glyphicon-calendar"></i>
                    </button>

                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a href="#" data-value="today">Today</a></li>
                        <li><a href="#" data-value="yesterday">Yesterday</a></li>
                        <li><a href="#" data-value="last_7_days">Last 7 Days</a></li>
                        <li><a href="#" data-value="this_month">This Month</a></li>
                        <li><a href="#" data-value="all_time">All Time</a></li>
                    </ul>
                </div>
            </div>

            <div class="dash-value">
                <?= to_currency($dashboard['today_expenses_total']) ?>
            </div>

            <div class="dash-label">Today's Expenses</div>
        </div>

        <!-- Total Customers -->
        <div class="gs-card gs-purple">
            <div class="gs-card-top">
                <div class="gs-card-icon">
                    <i class="glyphicon glyphicon-user"></i>
                </div>
            </div>

            <div class="dash-value">
                <?= (int) $dashboard['total_customers'] ?>
            </div>

            <div class="dash-label">Total Customers</div>
        </div>

        <!-- Total Products -->
        <div class="gs-card gs-blue">
            <div class="gs-card-top">
                <div class="gs-card-icon">
                    <i class="glyphicon glyphicon-tags"></i>
                </div>
            </div>

            <div class="dash-value">
                <?= (int) $dashboard['total_products'] ?>
            </div>

            <div class="dash-label">Total Products</div>
        </div>

        <!-- Total Stock Value -->
        <div class="gs-card gs-purple">
            <div class="gs-card-top">
                <div class="gs-card-icon">
                    <i class="glyphicon glyphicon-briefcase"></i>
                </div>
            </div>

            <div class="dash-value">
                <?= to_currency($dashboard['total_stock_value']) ?>
            </div>

            <div class="dash-label">Total Stock Value</div>
        </div>

    </div>

    <!-- ===== Tables Section ===== -->
    <div class="gs-tables-section">

        <h3 class="gs-section-title">
            <i class="glyphicon glyphicon-time"></i> Recent Sales
        </h3>

        <div class="gs-table-card">
            <?php if (!empty($dashboard['recent_sales'])): ?>
                <table class="gs-table">
                    <thead>
                        <tr>
                            <th>Sale ID</th>
                            <th>Date & Time</th>
                            <th>Customer</th>
                            <th>Payment</th>
                            <th style="text-align: right;">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($dashboard['recent_sales'] as $sale): ?>
                            <tr>
                                <td>#<?= (int) $sale['sale_id'] ?></td>
                                <td><?= esc($sale['sale_time']) ?></td>
                                <td><?= esc($sale['customer_name']) ?></td>
                                <td><span class="gs-badge gs-badge-green"><?= esc($sale['payment_type']) ?></span></td>
                                <td style="text-align: right;"><?= to_currency($sale['sale_total']) ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <div class="gs-empty-state">No sales yet. Start selling to see recent transactions here.</div>
            <?php endif; ?>
        </div>

        <div class="gs-tables-grid">

            <div>
                <h3 class="gs-section-title">
                    <i class="glyphicon glyphicon-fire"></i> Top Selling Products
                </h3>

                <div class="gs-table-card">
                    <?php if (!empty($dashboard['top_selling'])): ?>
                        <table class="gs-table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th style="text-align: right;">Qty Sold</th>
                                    <th style="text-align: right;">Revenue</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($dashboard['top_selling'] as $product): ?>
                                    <tr>
                                        <td>
                                            <?= esc($product['name']) ?>
                                            <span class="gs-unit-tag"><?= esc($product['unit_name']) ?></span>
                                        </td>
                                        <td style="text-align: right;"><?= (int) $product['total_qty'] ?></td>
                                        <td style="text-align: right;"><?= to_currency($product['total_revenue']) ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <div class="gs-empty-state">No sales data yet.</div>
                    <?php endif; ?>
                </div>
            </div>

            <div>
                <h3 class="gs-section-title">
                    <i class="glyphicon glyphicon-alert"></i> Low Stock Items
                </h3>

                <div class="gs-table-card">
                    <?php if (!empty($dashboard['low_stock_items'])): ?>
                        <table class="gs-table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th style="text-align: right;">Current</th>
                                    <th style="text-align: right;">Reorder</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($dashboard['low_stock_items'] as $item): ?>
                                    <tr>
                                        <td>
                                            <?= esc($item['name']) ?>
                                            <span class="gs-unit-tag"><?= esc($item['unit_name']) ?></span>
                                        </td>
                                        <td style="text-align: right;">
                                            <span class="gs-stock-warn"><?= (int) $item['current_qty'] ?></span>
                                        </td>
                                        <td style="text-align: right;"><?= (int) $item['reorder_level'] ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <div class="gs-empty-state">All items are well stocked. ✓</div>
                    <?php endif; ?>
                </div>
            </div>

        </div>
    </div>

</div>

<script>
$(document).ready(function() {

    var csrfToken = $('meta[name="csrf_hash"]').attr('content') || '';

    // Keep the card with an open dropdown above the cards that follow it
    $('.gs-card .dropdown')
        .on('show.bs.dropdown', function() {
            $(this).closest('.gs-card').addClass('gs-dropdown-open');
        })
        .on('hidden.bs.dropdown', function() {
            $(this).closest('.gs-card').removeClass('gs-dropdown-open');
        });

    $('.gs-card .dropdown-menu a').on('click', function(e) {
        e.preventDefault();

        var $card = $(this).closest('.gs-card');
        var label = $card.find('.dash-label').text().trim().toLowerCase();
        var dateRange = $(this).data('value');

        var cardType = '';

        if (label.includes('sales')) {
            cardType = 'sales';
        } else if (label.includes('profit')) {
            cardType = 'profit';
        } else if (label.includes('income')) {
            cardType = 'income';
        } else if (label.includes('expense')) {
            cardType = 'expenses';
        }

        if (!cardType) {
            return;
        }

        var $valueDiv = $card.find('.dash-value');
        var $labelDiv = $card.find('.dash-label');

        var oldValue = $valueDiv.html();
        var oldLabel = $labelDiv.html();

        $valueDiv.html('<i class="glyphicon glyphicon-refresh glyphicon-spin"></i>');

        $.ajax({
            url: '<?= site_url('home/get_dashboard_data') ?>',
            method: 'POST',
            data: {
                card_type: cardType,
                date_range: dateRange
            },
            headers: {
                'X-CSRF-TOKEN': csrfToken
            },
            dataType: 'json',

            success: function(response) {
                if (response.success) {
                    $valueDiv.html(response.value);

                    if (response.label) {
                        $labelDiv.html(response.label);
                    }
                } else {
                    $valueDiv.html(oldValue);
                    $labelDiv.html(oldLabel);
                    alert('Error: ' + (response.error || 'Unknown error'));
                }
            },

            error: function(xhr, status, error) {
                $valueDiv.html(oldValue);
                $labelDiv.html(oldLabel);
                alert('Request failed: ' + error);
            }
        });
    });

});
</script>

<?= view('partial/footer') ?>