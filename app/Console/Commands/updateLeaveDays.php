<?php

namespace App\Console\Commands;

use App\Models\User;
use Illuminate\Console\Command;

class updateLeaveDays extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:updateLeaveDays';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $users = User::all();

        foreach ($users as $user) {
            $totalDays = $user['leave_days_left'] + 15;
            $user->update([
                'leave_days_left' => $totalDays,
            ]);
        }
    }
}