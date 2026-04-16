#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Apr 16 00:18:34 2026                
#                                                     
#######################################################

#@(#)CDS: Innovus v25.10-p002_1 (64bit) 04/23/2025 12:43 (Linux 4.18.0-305.el8.x86_64)
#@(#)CDS: NanoRoute 25.10-p002_1 NR250317-0405/25_10-UB (database version 18.20.663) {superthreading v2.20}
#@(#)CDS: AAE 25.10-b008 (64bit) 04/23/2025 (Linux 4.18.0-305.el8.x86_64)
#@(#)CDS: CTE 25.10-b014_1 () Mar 28 2025 03:11:49 ( )
#@(#)CDS: SYNTECH 25.10-b006_1 () Mar 13 2025 03:32:26 ( )
#@(#)CDS: CPE v25.10-b011
#@(#)CDS: IQuantus/TQuantus 24.1.0-s201 (64bit) Thu Mar 20 10:21:58 PDT 2025 (Linux 4.18.0-305.el8.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
set init_verilog top.vh
set init_top_cell top
set init_lef_file /clear/apps/osu/soc/cadence/lib/ami05/lib/osu05_stdcells.lef
set init_gnd_net gnd
set init_design_settop 0
set init_pwr_net vdd
init_design
saveDesign top.enc
getIoFlowFlag
setIoFlowFlag 0
floorPlan -r 1.0 0.8 21 21 21 21
uiSetTool select
getIoFlowFlag
fit
clearGlobalNets
globalNetConnect gnd -type pgpin -pin gnd -inst *
globalNetConnect vdd -type pgpin -pin vdd -inst *
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.2
set sprCreateIeRingSpacing 1.2
set sprCreateIeRingOffset 1.2
set sprCreateIeRingThreshold 1.2
set sprCreateIeRingJogDistance 1.2
setPlaceMode -placeIoPins true
setAddRingMode -stacked_via_top_layer metal3
setAddRingMode -stacked_via_bottom_layer metal1
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -center 1 -type core_rings -jog_distance 1.8 -threshold 1.8 -nets {gnd vdd} -follow core -layer {bottom metal1 top metal1 right metal2 left metal2} -width 6.0 -spacing 1.2 -offset 1.8
getPlaceMode -place_hierarchical_flow -quiet
report_message -start_cmd
getRouteMode -maxRouteLayer -quiet
getRouteMode -user -maxRouteLayer
getPlaceMode -place_global_place_io_pins -quiet
getPlaceMode -user -maxRouteLayer
getPlaceMode -quiet -adaptiveFlowMode
getPlaceMode -timingDriven -quiet
getPlaceMode -adaptive -quiet
getPlaceMode -relaxSoftBlockageMode -quiet
getPlaceMode -user -relaxSoftBlockageMode
getPlaceMode -ignoreScan -quiet
getPlaceMode -user -ignoreScan
getPlaceMode -repairPlace -quiet
getPlaceMode -user -repairPlace
getPlaceMode -inPlaceOptMode -quiet
getPlaceMode -quiet -bypassFlowEffortHighChecking
getDesignMode -quiet -siPrevention
getPlaceMode -quiet -place_global_exp_enable_3d
getPlaceMode -quiet -place_global_exp_ignore_intra_ilm_out_of_corebox_check
getPlaceMode -place_global_place_io_pins -quiet
getPlaceMode -place_global_check_io_pins -quiet
getPlaceMode -exp_slack_driven -quiet
um::push_snapshot_stack
getDesignMode -quiet -flowEffort
getDesignMode -highSpeedCore -quiet
getPlaceMode -quiet -adaptive
set spgFlowInInitialPlace 1
getPlaceMode -sdpAlignment -quiet
getPlaceMode -softGuide -quiet
getPlaceMode -useSdpGroup -quiet
getPlaceMode -sdpAlignment -quiet
getPlaceMode -enableDbSaveAreaPadding -quiet
getPlaceMode -quiet -wireLenOptEffort
getPlaceMode -sdpPlace -quiet
getPlaceMode -exp_slack_driven -quiet
getPlaceMode -sdpPlace -quiet
getPlaceMode -groupHighLevelClkGate -quiet
setvar spgRptErrorForScanConnection 0
getPlaceMode -place_global_exp_allow_missing_scan_chain -quiet
getPlaceMode -place_check_library -quiet
getPlaceMode -place_detail_exp_enable_3d_hdb -quiet
getPlaceMode -place_global_exp_heterogeneous_3d_placement -quiet
getPlaceMode -trimView -quiet
getPlaceMode -expTrimOptBeforeTDGP -quiet
getPlaceMode -quiet -useNonTimingDeleteBufferTree
getPlaceMode -congEffort -quiet
getPlaceMode -relaxSoftBlockageMode -quiet
getPlaceMode -user -relaxSoftBlockageMode
getPlaceMode -ignoreScan -quiet
getPlaceMode -user -ignoreScan
getPlaceMode -repairPlace -quiet
getPlaceMode -user -repairPlace
getPlaceMode -congEffort -quiet
getPlaceMode -fp -quiet
getPlaceMode -timingDriven -quiet
getPlaceMode -user -timingDriven
getPlaceMode -fastFp -quiet
getPlaceMode -clusterMode -quiet
get_proto_model -type_match {flex_module flex_instgroup} -committed -name -tcl
getPlaceMode -inPlaceOptMode -quiet
getPlaceMode -quiet -bypassFlowEffortHighChecking
getPlaceMode -ultraCongEffortFlow -quiet
getPlaceMode -forceTiming -quiet
getPlaceMode -fp -quiet
getPlaceMode -fastfp -quiet
getPlaceMode -timingDriven -quiet
setPlaceMode -timingDriven 0
getPlaceMode -fp -quiet
getPlaceMode -fastfp -quiet
getPlaceMode -powerDriven -quiet
getExtractRCMode -quiet -engine
getAnalysisMode -quiet -clkSrcPath
getAnalysisMode -quiet -clockPropagation
getAnalysisMode -quiet -cppr
setExtractRCMode -engine preRoute
setAnalysisMode -clkSrcPath false -clockPropagation forcedIdeal
getPlaceMode -exp_slack_driven -quiet
isAnalysisModeSetup
getPlaceMode -quiet -place_global_exp_solve_unbalance_path
getPlaceMode -quiet -NMPsuppressInfo
getPlaceMode -quiet -place_global_exp_wns_focus_v2
getPlaceMode -quiet -place_incr_exp_isolation_flow
getPlaceMode -wl_budget_mode -quiet
setPlaceMode -reset -place_global_exp_balance_buffer_chain
getPlaceMode -wl_budget_mode -quiet
setPlaceMode -reset -place_global_exp_balance_pipeline
getPlaceMode -place_global_exp_balance_buffer_chain -quiet
getPlaceMode -place_global_exp_balance_pipeline -quiet
getPlaceMode -tdgpMemFlow -quiet
getPlaceMode -user -resetCombineRFLevel
getPlaceMode -quiet -resetCombineRFLevel
setPlaceMode -resetCombineRFLevel 1000
getPlaceMode -place_global_exp_skp_unbalanced_net_weight -quiet
getPlaceMode -place_global_exp_skp_path_based_begin_point -quiet
setvar spgSpeedupBuildVSM 1
getPlaceMode -tdgpResetCteTG -quiet
getPlaceMode -macroPlaceMode -quiet
getPlaceMode -place_global_replace_QP -quiet
getPlaceMode -macroPlaceMode -quiet
getPlaceMode -enableDistPlace -quiet
getPlaceMode -exp_slack_driven -quiet
getPlaceMode -place_global_ignore_spare -quiet
getPlaceMode -quiet -expNewFastMode
setPlaceMode -expHiddenFastMode 1
setPlaceMode -reset -ignoreScan
getPlaceMode -quiet -place_global_exp_auto_finish_floorplan
getPlaceMode -quiet -IOSlackAdjust
getPlaceMode -tdgpCteZeroDelayModeDelBuf -quiet
set_global timing_enable_zero_delay_analysis_mode true
getPlaceMode -quiet -useNonTimingDeleteBufferTree
getPlaceMode -quiet -prePlaceOptSimplifyNetlist
getPlaceMode -quiet -enablePrePlaceOptimizations
getPlaceMode -quiet -prePlaceOptDecloneInv
deleteBufferTree -decloneInv
getPlaceMode -tdgpCteZeroDelayModeDelBuf -quiet
set_global timing_enable_zero_delay_analysis_mode false
getPlaceMode -exp_slack_driven -quiet
all_setup_analysis_views
getPlaceMode -quiet -expSkipGP
getPlaceMode -quiet -place_global_exp_inverter_rewiring
getPlaceMode -quiet -place_global_exp_enable_wdir_incrP_handoff
getPlaceMode -ignoreUnproperPowerInit -quiet
getPlaceMode -quiet -expSkipGP
setDelayCalMode -engine feDc
unsetPinConstraint -edge -pin * -cell *
