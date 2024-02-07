<?php

namespace App\Http\Controllers;

use App\Http\Resources\ServiceCollection;
use App\Models\Service;
use Illuminate\Http\Request;

class ServiceTypeController extends Controller
{
    public function index($type_id)
    {
        $services = Service::get()->where('type_id', $type_id);
        if(is_null($services)){
            return response()->json('Ne postoje usluge koji pripadaju ovom tipu!', 404);
        }
        return response()->json(new ServiceCollection($services));
    }
}
