package SystemFunctions {
    
    // Top-level function defs
    action def ProvideAerodynamicPerformance;
    action def ControlAirplaneTrajectory;
    action def ControlAirplaneEnergy {
        // Nested functions are modelled as contained action usages
        action maintainOrIncreaseAirplaneEnergy : MaintainOrIncreaseAirplaneEnergy;
        action reduceAirplaneEnergy : ReduceAirplaneEnergy;
    }
    action def ProvideHighLiftCapability;
    action def ProvideSurvivableEnvironment;
    action def ProvideCrewSituationalAwareness;
    action def MaintainStructuralIntegrity;
    action def ProvideEmergencyServices;
    action def ProvidePassengerAndCargoServices;

    // Child function defs
    action def MaintainOrIncreaseAirplaneEnergy;
    action def ReduceAirplaneEnergy {
        action provideControlledAerodynamicDrag : ProvideControlledAerodynamicDrag;
        action decelerateOnGround : DecelerateOnGround;
    }
    action def ProvideControlledAerodynamicDrag;
    action def DecelerateOnGround {
        action decelerateTheWheelsOnGround : DecelerateTheWheelsOnGround;
        action decelerateTheWheelsOnGearRetraction : DecelerateTheWheelsOnGearRetraction;
        action decelerateTheWheelsDifferentiallyForDirectionalControl : DecelerateTheWheelsDifferentiallyForDirectionalControl;
        action preventAirplaneMotionWhenParked : PreventAirplaneMotionWhenParked;
    }
    action def DecelerateTheWheelsOnGround {
        action decelerateTheWheelsOnCommand : DecelerateTheWheelsOnCommand;
        action automaticallyCommandWheelDecelerationOnLandingAndRejectedTakeoff : AutomaticallyCommandWheelDecelerationOnLandingAndRejectedTakeoff;
        action preventTireSkiddingDuringWheelDeceleration : PreventTireSkiddingDuringWheelDeceleration;
        action provideWheelBrakeSystemAnnunciation : ProvideWheelBrakeSystemAnnunciation;
    }    
    action def DecelerateTheWheelsOnCommand;
    action def AutomaticallyCommandWheelDecelerationOnLandingAndRejectedTakeoff;
    action def PreventTireSkiddingDuringWheelDeceleration;
    action def ProvideWheelBrakeSystemAnnunciation;
    action def DecelerateTheWheelsOnGearRetraction;
    action def DecelerateTheWheelsDifferentiallyForDirectionalControl;
    action def PreventAirplaneMotionWhenParked;

}
