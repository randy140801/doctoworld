<?php

namespace Vtlabs\Report\Traits;

use Vtlabs\Report\Models\Report;
use Illuminate\Database\Eloquent\Model;

trait CanBeReported
{
    public function report(Model $reporter, $data = []): Report
    {
        $report = Report::create(array_merge($data, [
            'reportable_id' => $this->getKey(),
            'reportable_type' => $this->getMorphClass(),
            'reporter_id' => $reporter->getKey(),
            'reporter_type' => $reporter->getMorphClass(),
        ]));

        return $report;
    }
}
