<?php

namespace Vtlabs\Ecommerce\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DeliveryModeResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'title_translations' => $this->getTranslations('title'),
            'detail' => $this->detail,
            'detail_translations' => $this->getTranslations('detail'),
            'meta' => $this->meta,
            'price' => $this->price,
            'enabled' => $this->enabled
        ];
    }
}