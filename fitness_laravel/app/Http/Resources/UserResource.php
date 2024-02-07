<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */

    public static $wrap='user';

    public function toArray($request)
    {
        return [
            'id'=>$this->resource->id,
            'firstname'=>$this->resource->firstname,
            'lastname'=>$this->resource->lastname,
            'birthday'=>$this->resource->birthday,
            'email'=>$this->resource->email,
            'category'=>new CategoryResource($this->resource->category),
            'admin'=>$this->resource->admin
        ];
    }
}
