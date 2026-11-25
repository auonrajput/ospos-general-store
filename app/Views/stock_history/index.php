<?= view('partial/header') ?>
<style>
    .im-wrap { max-width:1100px; margin:0 auto; }
    .im-table { width:100%; border-collapse:collapse; margin-top:15px; }
    .im-table th, .im-table td { padding:10px 12px; text-align:left; border-bottom:1px solid #383838; font-size:13px; color:var(--panel-text); }
    .im-table th { color:var(--panel-text); border-bottom:2px solid #444; }
    .im-qty-pos { color:#2ecc71; font-weight:bold; }
    .im-qty-neg { color:#e74c3c; font-weight:bold; }
    .im-empty { text-align:center; color:var(--panel-text-muted); padding:30px; }
</style>
<div class="im-wrap">
    <h3 style="color:var(--panel-text);">Stock History</h3>
    <table class="im-table">
        <thead>
            <tr>
                <th>Date</th>
                <th>Product</th>
                <th>Note</th>
                <th>Qty Change</th>
                <th>User</th>
            </tr>
        </thead>
        <tbody id="im_rows">
            <tr><td colspan="5" class="im-empty">Loading...</td></tr>
        </tbody>
    </table>
</div>
<script>
$(document).ready(function() {
    $.getJSON("<?= site_url('stock_history/list') ?>", function(data) {
        var html = '';
        if (data.length === 0) {
            html = '<tr><td colspan="5" class="im-empty">No movements found</td></tr>';
        } else {
            data.forEach(function(row) {
                var qty = parseFloat(row.trans_inventory);
                var qtyClass = qty >= 0 ? 'im-qty-pos' : 'im-qty-neg';
                var qtyDisplay = (qty >= 0 ? '+' : '') + qty;
                html += '<tr>';
                html += '<td>' + row.trans_date + '</td>';
                html += '<td>' + (row.item_name || '-') + '</td>';
                html += '<td>' + (row.trans_comment || '-') + '</td>';
                html += '<td class="' + qtyClass + '">' + qtyDisplay + '</td>';
                html += '<td>' + (row.user_name || '-') + '</td>';
                html += '</tr>';
            });
        }
        $('#im_rows').html(html);
    });
});
</script>
<?= view('partial/footer') ?>
