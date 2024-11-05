helperSetupEuroNCAPTest
modelName = "DrivingTestBench";
open_system(modelName)
open_system("Controller")
open_system(modelName + "/Vehicle Dynamics/Vehicle Dynamics")
open_system(modelName+"/Vehicle Dynamics/Vehicle Dynamics/3DOF")
open_system("VehDyn14DOF")
open_system(modelName + "/Scenario and Environment")
testName = "SA AEB CCRm";
ncapSpecTable = ncapSpec(testName);
disp(ncapSpecTable)
egoSpeed = 18.056; % ego speed in meters per second
impactOverlap = "75%";
egoSpeedIndices = (find(abs(ncapSpecTable{:,1}-egoSpeed) < 1e-2));
impactOverlapIndex = find(ncapSpecTable{egoSpeedIndices,2} == impactOverlap);
variantIndex = egoSpeedIndices(impactOverlapIndex);
disp(variantIndex)
egoAssetFile = "Vehicles/ADT Vehicles/SK_Sedan.fbx_rrx";
egoAssetDim = helperGetActorDimensions(egoAssetFile);
[rrScenarioFileName,testData] = helperCreateEuroNCAPscenario(testName,variantIndex,egoAssetDim,egoAssetFile);