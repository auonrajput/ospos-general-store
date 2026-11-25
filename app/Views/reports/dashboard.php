<?php
/**
 * @var string $start_date
 * @var array $sales_summary
 * @var array $payments_data
 * @var array $top_items
 */
?>

<?= view('partial/header') ?>

<style>
    .gs-reports {
        max-width: 1400px;
        margin: 0 auto;
        padding: 20px 24px 35px;
        color: #1B4332;
        box-sizing: border-box;
    }

    .gs-reports .gs-rep-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 12px;
        margin-bottom: 25px;
        padding-bottom: 15px;
        border-bottom: 1px solid #B7D8C0;
    }

    .gs-reports .gs-rep-header h2 {
        margin: 0;
        font-size: 24px;
        font-weight: 700;
        color: #1B4332;
    }

    .gs-reports .gs-rep-actions {
        display: flex;
        gap: 10px;
        align-items: center;
        flex-wrap: wrap;
    }

    .gs-reports .gs-home-btn {
        background: #1B4332;
        color: #fff;
        padding: 8px 15px;
        border-radius: 6px;
        text-decoration: none;
        font-weight: 700;
        font-size: 14px;
    }

    .gs-reports .gs-home-btn:hover {
        background: #2D6A4F;
        color: #fff;
    }

    .gs-reports .date-badge {
        background: #E8F3E9;
        border: 1px solid #B7D8C0;
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 14px;
        color: #2D6A4F;
        font-weight: 700;
    }

    /* Stat cards */
    .gs-reports .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
        gap: 18px;
        margin-bottom: 28px;
    }

    .gs-reports .stat-card {
        position: relative;
        overflow: hidden;
        padding: 22px 22px 22px 26px;
        background: #E8F3E9;
        border: 1px solid #B7D8C0;
        border-radius: 13px;
        box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
    }

    .gs-reports .stat-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 5px;
        height: 100%;
    }

    .gs-reports .stat-card.revenue::before { background: #40916C; }
    .gs-reports .stat-card.profit::before { background: #d97706; }
    .gs-reports .stat-card.sales::before { background: #1B4332; }
    .gs-reports .stat-card.transactions::before { background: #dc2626; }

    .gs-reports .stat-card h3 {
        margin: 0 0 10px 0;
        font-size: 12px;
        color: #456B57;
        text-transform: uppercase;
        letter-spacing: .5px;
        font-weight: 600;
    }

    .gs-reports .stat-card .value {
        margin: 0;
        font-size: 28px;
        font-weight: 700;
        color: #1B4332;
        overflow-wrap: anywhere;
    }

    /* Panels */
    .gs-reports .dashboard-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 18px;
        margin-bottom: 28px;
    }

    .gs-reports .panel {
        background: #E8F3E9;
        border: 1px solid #B7D8C0;
        border-radius: 13px;
        padding: 22px;
        margin: 0;
        box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
        min-width: 0;
    }

    .gs-reports .panel h3 {
        margin: 0 0 18px 0;
        font-size: 17px;
        font-weight: 700;
        color: #1B4332;
        border-bottom: 1px solid #B7D8C0;
        padding-bottom: 10px;
    }

    .gs-reports .payment-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 12px;
        padding: 12px 0;
        border-bottom: 1px solid #B7D8C0;
    }

    .gs-reports .payment-item:last-child {
        border-bottom: none;
    }

    .gs-reports .payment-name {
        font-weight: 600;
        color: #1B4332;
    }

    .gs-reports .payment-amount {
        font-weight: 700;
        color: #2D6A4F;
        white-space: nowrap;
    }

    .gs-reports .payment-bar {
        height: 6px;
        background: #D5EAD9;
        border-radius: 3px;
        margin-top: 8px;
        overflow: hidden;
    }

    .gs-reports .payment-fill {
        height: 100%;
        background: #40916C;
        border-radius: 3px;
    }

    .gs-reports .top-items-scroll {
        width: 100%;
        overflow-x: auto;
    }

    .gs-reports table {
        width: 100%;
        border-collapse: collapse;
    }

    .gs-reports th,
    .gs-reports td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #B7D8C0;
        font-size: 14px;
        color: #1B4332;
    }

    .gs-reports th {
        color: #456B57;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 12px;
    }

    .gs-reports tr:last-child td {
        border-bottom: none;
    }

    /* Detailed report links */
    .gs-reports .classic-links h3 {
        margin: 0 0 16px 0;
        font-size: 17px;
        font-weight: 700;
        color: #1B4332;
    }

    .gs-reports .links-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 14px;
    }

    .gs-reports .report-link {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 15px;
        background: #E8F3E9;
        border: 1px solid #B7D8C0;
        border-radius: 10px;
        color: #1B4332;
        font-weight: 600;
        text-decoration: none;
        transition: background .2s ease, border-color .2s ease, transform .2s ease;
    }

    .gs-reports .report-link:hover {
        background: #1B4332;
        border-color: #1B4332;
        color: #fff;
        transform: translateY(-2px);
    }

    .gs-reports .report-link span {
        font-size: 20px;
    }

    @media (max-width: 900px) {
        .gs-reports .dashboard-grid {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 575px) {
        .gs-reports {
            padding: 10px 12px 20px;
        }

        .gs-reports .gs-rep-header h2 {
            font-size: 20px;
        }

        .gs-reports .stats-grid {
            grid-template-columns: 1fr;
            gap: 12px;
        }

        .gs-reports .stat-card .value {
            font-size: 24px;
        }

        .gs-reports .panel {
            padding: 14px;
        }

        .gs-reports .links-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="gs-reports">

    <div class="gs-rep-header">
        <h2>📊 Reports Dashboard</h2>
        <div class="gs-rep-actions">
            <a href="<?= site_url('home') ?>" class="gs-home-btn">🏠 Home</a>
            <div class="date-badge"><?= date('M Y', strtotime($start_date)) ?></div>
        </div>
    </div>

    <!-- Stat Cards -->
    <div class="stats-grid">
        <div class="stat-card revenue">
            <h3>Total Revenue</h3>
            <p class="value">Rs <?= number_format($sales_summary['total'] ?? 0, 2) ?></p>
        </div>
        <div class="stat-card profit">
            <h3>Gross Profit</h3>
            <p class="value">Rs <?= number_format($sales_summary['profit'] ?? 0, 2) ?></p>
        </div>
        <div class="stat-card sales">
            <h3>Items Sold</h3>
            <p class="value"><?= number_format($sales_summary['quantity_purchased'] ?? 0, 0) ?></p>
        </div>
        <div class="stat-card transactions">
            <h3>Total Transactions</h3>
            <p class="value"><?= number_format($sales_summary['count'] ?? 0, 0) ?></p>
        </div>
    </div>

    <!-- Dashboard Grid -->
    <div class="dashboard-grid">

        <!-- Payment Breakdown -->
        <div class="panel">
            <h3>💳 Payment Breakdown</h3>
            <?php
            // Same filter as the graphical payments report: only real payment rows
            $payment_rows = [];
            $total_payment = 0;
            foreach ($payments_data as $p) {
                if (($p['trans_group'] ?? '') == '<HR>') {
                    continue;
                }
                if (($p['trans_group'] ?? '') != lang('Reports.trans_payments')) {
                    continue;
                }
                if (empty($p['trans_type']) || $p['trans_type'] == '--') {
                    continue;
                }
                $payment_rows[] = $p;
                $total_payment += floatval($p['trans_amount']);
            }
            ?>
            <?php if (empty($payment_rows)): ?>
                <div style="text-align:center; color:#456B57; padding: 12px 0;">No payment data found.</div>
            <?php else: ?>
                <?php foreach ($payment_rows as $p): ?>
                    <div class="payment-item">
                        <div style="flex: 1; min-width: 0;">
                            <div class="payment-name"><?= esc($p['trans_type']) ?></div>
                            <div class="payment-bar">
                                <div class="payment-fill" style="width: <?= $total_payment > 0 ? round((floatval($p['trans_amount']) / $total_payment) * 100, 1) : 0 ?>%;"></div>
                            </div>
                        </div>
                        <div class="payment-amount">Rs <?= number_format(floatval($p['trans_amount']), 2) ?></div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>

        <!-- Top Products -->
        <div class="panel">
            <h3>🏆 Top 5 Products</h3>
            <div class="top-items-scroll">
                <table>
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Qty</th>
                            <th>Revenue</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (empty($top_items)): ?>
                            <tr><td colspan="3" style="text-align:center; color:#456B57;">No sales data found.</td></tr>
                        <?php else: ?>
                            <?php foreach ($top_items as $item): ?>
                            <tr>
                                <td><?= esc($item['name']) ?></td>
                                <td><?= number_format($item['quantity_purchased'], 0) ?></td>
                                <td style="color: #2D6A4F; font-weight: bold;">Rs <?= number_format($item['total'], 2) ?></td>
                            </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Classic Reports Links -->
    <div class="classic-links">
        <h3>📑 Detailed Reports</h3>
        <div class="links-grid">
            <a href="<?= site_url('reports/summary_sales') ?>" class="report-link"><span>📈</span> Sales Summary</a>
            <a href="<?= site_url('reports/summary_credit_sales') ?>" class="report-link"><span>💳</span> Credit Sales</a>
            <a href="<?= site_url('reports/summary_customer_ledger') ?>" class="report-link"><span>📒</span> Customer Ledger (Udhar)</a>
            <a href="<?= site_url('reports/detailed_sales') ?>" class="report-link"><span>📝</span> Detailed Sales</a>
            <a href="<?= site_url('reports/summary_items') ?>" class="report-link"><span>📦</span> Items Summary</a>
            <a href="<?= site_url('reports/summary_customers') ?>" class="report-link"><span>👥</span> Customers Summary</a>
            <a href="<?= site_url('reports/summary_employees') ?>" class="report-link"><span>👔</span> Employees Summary</a>
            <a href="<?= site_url('reports/inventory_summary') ?>" class="report-link"><span>🏭</span> Inventory Summary</a>
            <a href="<?= site_url('reports/inventory_low') ?>" class="report-link"><span>⚠️</span> Low Inventory</a>
            <a href="<?= site_url('reports/summary_taxes') ?>" class="report-link"><span>🏛️</span> Taxes Summary</a>
            <a href="<?= site_url('reports/detailed_receivings') ?>" class="report-link"><span>🛒</span> Purchases</a>
            <a href="<?= site_url('reports/summary_expenses_categories') ?>" class="report-link"><span>💸</span> Expenses</a>
        </div>
    </div>

</div>

<?= view('partial/footer') ?>