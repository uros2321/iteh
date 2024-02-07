<?php

namespace App\Http\Controllers;

use App\Http\Resources\UsageCollection;
use App\Http\Resources\UsageResource;
use App\Models\Usage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UsageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user_id = auth()->user()->id;
        $usages = Usage::get()->where('user_id', $user_id);
        if (is_null($usages)) {
            return response()->json('Nemate nijednu uslugu', 404);
        }
        return new UsageCollection($usages);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'service_id' => 'required',
            'date_from' => 'required|date',
            'date_to' => 'required|after:date_from'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }

        $usage = Usage::create([
            'service_id' => $request->service_id,
            'user_id' => auth()->user()->id,
            'date_from' => $request->date_from,
            'date_to' => $request->date_to
        ]);

        return response()->json(['Koriscenje usluge je uspesno kreirano.', new UsageResource($usage), 'success' => true]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Usage  $usage
     * @return \Illuminate\Http\Response
     */
    public function show(Usage $usage)
    {
        return new UsageResource($usage);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Usage  $usage
     * @return \Illuminate\Http\Response
     */
    public function edit(Usage $usage)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Usage  $usage
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Usage $usage)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Usage  $usage
     * @return \Illuminate\Http\Response
     */
    public function destroy($usage_id)
    {
        $usage = Usage::get()->where('id', $usage_id)->first();
        if (!$usage) {
            return response()->json('Ne postoji izabrano koriscenje usluge', 404);
        }

        $usage->delete();

        return response()->json('Koriscenje usluge je obrisano.');
    }
}
