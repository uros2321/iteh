<?php

namespace Database\Factories;

use App\Models\Service;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Usage>
 */
class UsageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'date_from'=>$this->faker->date(),
            'date_to'=>$this->faker->dateTimeBetween('-1 year', 'now'),
            'user_id'=>User::factory(),
            'service_id'=>Service::factory()
        ];
    }
}
