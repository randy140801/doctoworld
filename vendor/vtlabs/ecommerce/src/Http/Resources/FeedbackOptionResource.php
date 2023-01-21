<?php

namespace Vtlabs\Ecommerce\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FeedbackOptionResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'rank' => $this->rank,
            'title' => $this->title,
            'title_translations' => $this->getTranslations('title'),
            'vendor_id' => $this->vendor_id
        ];
    }
}