<?php

if (!function_exists('log_activity')) {
    function log_activity(string $action, ?string $table_name = null, $ref_id = null, ?string $description = null): void
    {
        try {
            $session = service('session');
            $person_id = $session->get('person_id');
            $user_name = $session->get('first_name') . ' ' . $session->get('last_name');
            $user_name = trim($user_name) !== '' ? trim($user_name) : ($session->get('username') ?? 'system');

            $db = \Config\Database::connect();
            $db->table('activity_logs')->insert([
                'log_time'    => date('Y-m-d H:i:s'),
                'person_id'   => $person_id,
                'user_name'   => $user_name,
                'action'      => $action,
                'table_name'  => $table_name,
                'ref_id'      => $ref_id !== null ? (string)$ref_id : null,
                'description' => $description,
            ]);
        } catch (\Throwable $e) {
            log_message('error', 'Activity log failed: ' . $e->getMessage());
        }
    }
}
