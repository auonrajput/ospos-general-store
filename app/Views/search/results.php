<?php
/**
 * @var string $query
 * @var array $customers
 * @var array $items
 */
?>
<?= view('partial/header') ?>

<div style="padding: 15px;">
    <h3>Search Results for: "<?= esc($query) ?>"</h3>

    <form method="get" action="<?= site_url('search') ?>" class="form-inline" style="margin-bottom: 20px;">
        <input type="text" name="q" class="form-control" value="<?= esc($query) ?>" placeholder="Search customer or item...">
        <button type="submit" class="btn btn-info">Search</button>
    </form>

    <?php if (empty($query)) : ?>
        <p>Type something above and press Search to look across Customers and Items.</p>
    <?php else : ?>

        <h4>Customers (<?= count($customers) ?>)</h4>
        <?php if (empty($customers)) : ?>
            <p>No customers found.</p>
        <?php else : ?>
            <table class="table table-bordered">
                <tr><th>Name</th><th>Phone</th><th></th></tr>
                <?php foreach ($customers as $customer) : ?>
                    <tr>
                        <td><?= esc($customer->first_name . ' ' . $customer->last_name) ?></td>
                        <td><?= esc($customer->phone_number) ?></td>
                        <td><?= anchor("customers/view/$customer->person_id", 'View') ?></td>
                    </tr>
                <?php endforeach; ?>
            </table>
        <?php endif; ?>

        <h4>Items (<?= count($items) ?>)</h4>
        <?php if (empty($items)) : ?>
            <p>No items found.</p>
        <?php else : ?>
            <table class="table table-bordered">
                <tr><th>Name</th><th>Item #</th><th></th></tr>
                <?php foreach ($items as $item) : ?>
                    <tr>
                        <td><?= esc($item->name) ?></td>
                        <td><?= esc($item->item_number) ?></td>
                        <td><?= anchor("items/view/$item->item_id", 'View') ?></td>
                    </tr>
                <?php endforeach; ?>
            </table>
        <?php endif; ?>

    <?php endif; ?>
</div>

<?= view('partial/footer') ?>
