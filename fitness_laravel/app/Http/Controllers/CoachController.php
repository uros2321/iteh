<?php

namespace App\Http\Controllers;

use App\Http\Resources\CoachCollection;
use App\Http\Resources\CoachResource;
use App\Models\Coach;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CoachController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $coaches = Coach::all();
        return new CoachCollection($coaches);
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
            'firstname' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'experience' => 'required|string|max:255',
            'started' => 'required|date|before:tomorrow'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors());
        }

        $coach = Coach::create([
            'firstname' => $request->firstname,
            'lastname' => $request->lastname,
            'experience' => $request->experience,
            'started' => $request->started,
        ]);

        return response()->json(['Trener je uspesno kreiran.', new CoachResource($coach), 'success' => true]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Coach  $coach
     * @return \Illuminate\Http\Response
     */
    public function show(Coach $coach)
    {
        return new CoachResource($coach);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Coach  $coach
     * @return \Illuminate\Http\Response
     */
    public function edit(Coach $coach)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Coach  $coach
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $coach = Coach::find($id);

        $validator = Validator::make($request->all(), [
            'firstname' => 'required|string|max:255',
            'lastname' => 'required|string|max:255',
            'experience' => 'required|string|max:255',
            'started' => 'required|date|before:tomorrow'
        ]);

        if ($validator->fails())
            return response()->json($validator->errors());


        $coach->firstname = $request->firstname;
        $coach->lastname = $request->lastname;
        $coach->experience = $request->experience;
        $coach->started = $request->started;

        $coach->save();

        return response()->json(['Trener je uspesno azuriran.', new CoachResource($coach), 'success' => true]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Coach  $coach
     * @return \Illuminate\Http\Response
     */
    public function destroy(Coach $coach)
    {
        $coach->delete();
        return response()->json('Trener je uspesno izbrisan.');
    }
}
