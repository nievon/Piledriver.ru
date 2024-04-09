<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PcConfiguration;

class PcConfigurationController extends Controller
{
    public function saveConfig(Request $request)
    {
        $processorId = $request->input('processorId');
        $motherboardId = $request->input('motherboardId');
        $ramId = $request->input('ramId');
        $gpuId = $request->input('gpuId');
        $psuId = $request->input('psuId');
        $caseId = $request->input('caseId');
        $romId = $request->input('romId');
        $userId = $request->input('userId');

        $config = new PcConfiguration();
        $config->processor_id = $processorId;
        $config->motherboard_id = $motherboardId;
        $config->ram_id = $ramId;
        $config->gpu_id = $gpuId;
        $config->psu_id = $psuId;
        $config->case_id = $caseId;
        $config->rom_id = $romId;
        $config->user_id = $userId;
        $config->save();

        return response()->json(['success' => true]);
    }
}
