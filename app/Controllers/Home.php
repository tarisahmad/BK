<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('diskon');
        $query   = $builder->get();
        return view('home', [
            'diskons' => $query->getResult(),
        ]);
    }
    public function contact()
    {
        return view('contact');
    }
}
