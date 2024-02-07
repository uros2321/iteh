<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\Coach;
use App\Models\Service;
use App\Models\Type;
use App\Models\Usage;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Category::truncate();
        User::truncate();
        Type::truncate();
        Coach::truncate();
        Service::truncate();

        User::factory(5)->create();
        Coach::factory(5)->create();
        Service::factory(5)->create();

        $cat1 = Category::factory()->create();
        $cat2 = Category::factory()->create();

        $user1 = User::create([
            'firstname' => 'Nemanja',
            'lastname' => 'Gojkovic',
            'email' => 'admin@gmail.com',
            'birthday' => '2000-01-04',
            'password' => Hash::make('admin'),
            'category_id' => $cat1->id,
            'admin' => true,
        ]);
        $user2 = User::create([
            'firstname' => 'Filip',
            'lastname' => 'Filipovic',
            'email' => 'filip@gmail.com',
            'birthday' => '2001-06-11',
            'password' => Hash::make('filip'),
            'category_id' => $cat2->id,
            'admin' => false,
        ]);

        $service1 = Service::factory()->create();
        $service2 = Service::factory()->create();

        $date1=Carbon::now();

        Usage::factory()->create([
            'user_id' => $user2->id,
            'service_id' => $service1->id,
            'date_from' => $date1,
            'date_to' => $date1->copy()->addDays($service1->duration)
        ]);

        Usage::factory()->create([
            'user_id' => $user2->id,
            'service_id' => $service2->id,
            'date_from' => $date1,
            'date_to' => $date1->copy()->addDays($service2->duration)
        ]);
        
    }
}
