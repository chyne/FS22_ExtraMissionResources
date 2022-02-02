ExtraMissionResources = {}

function ExtraMissionResources:loadMap(name)
    MissionManager.getIsMissionWorkAllowed = Utils.overwrittenFunction(MissionManager.getIsMissionWorkAllowed, ExtraMissionResources.getIsMissionWorkAllowed)
end

function ExtraMissionResources:getIsMissionWorkAllowed(parentFunc, farmId, x, z, workAreaType)
    return parentFunc(self, farmId, x, z, workAreaType) or (parentFunc(self, farmId, x, z, WorkAreaType.COMBINESWATH) and (workAreaType == WorkAreaType.FORAGEWAGON or workAreaType == WorkAreaType.BALER)) or (parentFunc(self, farmId, x, z, WorkAreaType.CULTIVATOR) and workAreaType == WorkAreaType.STONEPICKER) or (parentFunc(self, farmId, x, z, WorkAreaType.PLOW) and workAreaType == WorkAreaType.STONEPICKER)
end

addModEventListener(ExtraMissionResources)

