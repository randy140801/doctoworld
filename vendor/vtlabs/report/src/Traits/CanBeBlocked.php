<?php

namespace Vtlabs\Report\Traits;

use Vtlabs\Report\Models\Block;
use Illuminate\Database\Eloquent\Model;

trait CanBeBlocked
{
    public function block(Model $blockable, $data = []): Block
    {
        $block = Block::create(array_merge($data, [
            'blockable_id' => $blockable->getKey(),
            'blockable_type' => $blockable->getMorphClass(),
            'blocker_id' => $this->getKey(),
            'blocker_type' =>  $this->getMorphClass(),
        ]));

        return $block;
    }

    public function unblock(Model $blockable, $data = []): bool
    {
        if ($this->hasBlocked($blockable)) {
            Block::where('blockable_id', $blockable->getKey())
                ->where('blockable_type', $blockable->getMorphClass())
                ->where('blocker_id', $this->getKey())
                ->where('blocker_type', $this->getMorphClass())->delete();
            return true;
        }
        return false;
    }

    public function hasBlocked(Model $blockable): bool
    {
        return Block::where('blockable_id', $blockable->getKey())->where('blockable_type', $blockable->getMorphClass())
            ->where('blocker_id', $this->getKey())
            ->where('blocker_type', $this->getMorphClass())->exists();
    }

    public function blockedList(string $blockableType)
    {
        return Block::where('blocker_id', $this->getKey())->where('blocker_type', $this->getMorphClass())->where('blockable_type', $blockableType);
    }
}
