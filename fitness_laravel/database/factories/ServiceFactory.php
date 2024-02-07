<?php

namespace Database\Factories;

use App\Models\Type;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Service>
 */
class ServiceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name'=>$this->faker->word(),
            'price'=>$this->faker->randomFloat(4, 0, 7000),
            'duration'=>$this->faker->numberBetween(0, 365),
            'description'=>$this->faker->text(),
            'type_id'=>Type::factory()
        ];
    }
}
