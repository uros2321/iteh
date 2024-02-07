<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CoachResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */


    public static $wrap='coach';
    
    public function toArray($request)
    {
        return [
            'id'=>$this->resource->id,
            'firstname'=>$this->resource->firstname,
            'lastname'=>$this->resource->lastname,
            'experience'=>$this->resource->experience,
            'started'=>$this->resource->started
        ];
    }
}
