<?php

namespace Vtlabs\Ecommerce\Filters;

use EloquentFilter\ModelFilter;
use Vtlabs\Core\Helpers\CoreHelper;

class DeliveryModeFilter extends ModelFilter
{
    public function setup()
    {
        if (!CoreHelper::isAdmin()) {
            $this->where('enabled', 1);
        }
    }
}
