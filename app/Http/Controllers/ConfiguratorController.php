<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Processor;
use App\Models\motherboards;
use App\Models\ram;
use App\Models\gpu;
use App\Models\rom;
use App\Models\casee;
use App\Models\dram;
use App\Models\gpuwatt;
use App\Models\psu;
use App\Models\socket;

class ConfiguratorController extends Controller
{
    public function index()
    {
        $processors = Processor::all();
        $motherboards = motherboards::all();
        $rams = ram::all();
        $gpus = Gpu::all();
        return view('confi.configurator', compact('processors', 'motherboards', 'gpus', 'rams'));
    }


    public function getProcessors()
    {
        $processors = Processor::all();

        return response()->json($processors);
    }


    public function getsockets()
    {
        $sockets = socket::all();

        return response()->json($sockets);
    }

    public function getsocketsshow($id)
    {
        $sockets = socket::find($id);

        return response()->json($sockets);
    }

    public function getdramsshow($id)
    {
        $dram = dram::find($id);

        return response()->json($dram);
    }

    public function getProcessorsshow($id)
    {
        $processor = Processor::find($id);

        return response()->json($processor);
    }

    public function getmothersshow($id)
    {
        $mb = motherboards::find($id);

        return response()->json($mb);
    }

    public function getramsshow($id)
    {
        $ram = Ram::select('idss', 'name', 'size', 'frequency', 'price', 'dram_id', 'brand', 'img_brand')
            ->where('idss', $id)
            ->first();

        return response()->json($ram);
    }

    public function getgpusshow($id)
    {
        $mb = gpu::find($id);

        return response()->json($mb);
    }

    public function getpsusshow($id)
    {
        $mb = psu::find($id);

        return response()->json($mb);
    }

    public function getcasesshow($id)
    {
        $mb = casee::find($id);

        return response()->json($mb);
    }

    public function getromsshow($id)
    {
        $mb = rom::find($id);

        return response()->json($mb);
    }

    public function getMotherboardsByProcessor(Request $request)
    {
        $processorId = $request->input('processor_id');

        // Найти сокет процессора
        $processor = Processor::find($processorId);
        if (!$processor) {
            return response()->json([]);
        }

        $socketId = $processor->socket_id;

        // Получить подходящие материнские платы на основе сокета
        $motherboards = motherboards::where('socket_id', $socketId)->get();

        return response()->json($motherboards);
    }

    public function getRams(Request $request)
    {
        $motherboardId = $request->input('motherboard_id');

        // Найти сокет материнской платы
        $motherboard = motherboards::find($motherboardId);
        if (!$motherboard) {
            return response()->json([]);
        }

        $socketId = $motherboard->socket_id;

        // Получить подходящие ОЗУ на основе сокета
        $rams = Ram::join('socketdrams', 'rams.dram_id', '=', 'socketdrams.dram_id')
            ->where('socketdrams.socket_id', $socketId)
            ->get();

        return response()->json($rams);
    }

    public function getGpus()
    {
        $gpus = Gpu::all();

        return response()->json($gpus);
    }

    public function getPsus()
    {
        $psus = psu::all();

        return response()->json($psus);
    }

    public function getRoms()
    {
        $roms = Rom::all();

        return response()->json($roms);
    }

    public function getCasees()
    {
        $casees = casee::all();

        return response()->json($casees);
    }
}
