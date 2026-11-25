<?php

use Config\OSPOS;

?>

            </div>
        </div>

        <style>
            /* Sticky footer: .wrapper is the real parent of #footer */
            .wrapper { min-height: 100vh; display: flex; flex-direction: column; }
            .wrapper > .topbar, .wrapper > .navbar { flex-shrink: 0; }
            .wrapper > .container { flex: 1 0 auto; }
            @media (max-width: 767px) { .wrapper > .container { width: 100%; } }
            #footer { margin-top: auto !important; margin-bottom: 0 !important; padding: 0 !important; flex-shrink: 0; }
            #footer .jumbotron { margin: 0 !important; border-radius: 0; }
        </style>

        <div id="footer">
            <div class="jumbotron push-spaces">
                <strong>
                    <?= lang('Common.copyrights', [date('Y')]) ?> ·
                    <a href="https://opensourcepos.org" target="_blank"><?= lang('Common.website') ?></a> ·
                    <?= esc(config('App')->application_version) ?> -
                    <a target="_blank" href="https://github.com/opensourcepos/opensourcepos/commit/<?= esc(config(OSPOS::class)->commit_sha1) ?>">
                        <?= esc(substr(config(OSPOS::class)->commit_sha1, 0, 6)); ?>
                    </a>
                </strong>.
            </div>
        </div>
    </body>
</html>