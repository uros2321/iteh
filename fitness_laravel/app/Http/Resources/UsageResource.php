<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UsageResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */

    public static $wrap='usage';

    public function toArray($request)
    {
        return [
            'user'=>new UserResource($this->resource->user),
            'service'=>new ServiceResource($this->resource->service),
            'date_from'=>$this->resource->date_from,
            'date_to'=>$this->resource->date_to
        ];
    }
}
