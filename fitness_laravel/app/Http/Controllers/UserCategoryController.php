<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserCollection;
use App\Models\User;
use Illuminate\Http\Request;

class UserCategoryController extends Controller
{
    public function index($category_id)
    {
        $users = User::get()->where('category_id', $category_id);
        if(is_null($users)){
            return response()->json('Ne postoje korisnici koji pripadaju ovoj kategoriji!', 404);
        }
        return response()->json(new UserCollection($users));
    }
}
