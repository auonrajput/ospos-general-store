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

    @media (max-width: 991px) {
        #dashboard_widgets {
            grid-template-columns: repeat(2, minmax(0, 1fr));
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