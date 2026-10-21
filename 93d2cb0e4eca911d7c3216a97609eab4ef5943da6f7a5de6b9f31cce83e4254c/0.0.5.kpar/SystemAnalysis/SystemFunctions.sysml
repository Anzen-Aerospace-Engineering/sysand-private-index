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
        doc /* Decelerate on Ground. */
        comment /* Source: ED-79B Appendix E, Figure E-3, page E-9, and Table E-3, pages E-12 to E-13. Level: aircraft/system allocation context. */
        action decelerateTheWheelsOnGround : DecelerateTheWheelsOnGround;
        action decelerateTheWheelsOnGearRetraction : DecelerateTheWheelsOnGearRetraction;
        action decelerateTheWheelsDifferentiallyForDirectionalControl : DecelerateTheWheelsDifferentiallyForDirectionalControl;
        action preventAirplaneMotionWhenParked : PreventAirplaneMotionWhenParked;
        action provideWheelSpeedDataToTheAirplane : ProvideWheelSpeedDataToTheAirplane;
    }
    action def DecelerateTheWheelsOnGround {
        doc /* Decelerate the wheels on the ground. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. */
        action decelerateTheWheelsOnCommand : DecelerateTheWheelsOnCommand;
        action automaticallyCommandWheelDecelerationOnLandingAndRejectedTakeoff : AutomaticallyCommandWheelDecelerationOnLandingAndRejectedTakeoff;
        action preventTireSkiddingDuringWheelDeceleration : PreventTireSkiddingDuringWheelDeceleration;
        action provideWheelBrakeSystemAnnunciation : ProvideWheelBrakeSystemAnnunciation;
    }    
    action def DecelerateTheWheelsOnCommand {
        doc /* Decelerate the wheels on command (manual or automatic). */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. */
    }
    action def AutomaticallyCommandWheelDecelerationOnLandingAndRejectedTakeoff {
        doc /* Automatically command wheel deceleration on landing and Rejected Takeoff (RTO). */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. ED-135 uses "Rejected Take-off (RTO)" wording. */
    }
    action def PreventTireSkiddingDuringWheelDeceleration {
        doc /* Prevent tire skidding during wheel deceleration. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. */
    }
    action def ProvideWheelBrakeSystemAnnunciation {
        doc /* Provide WBS annunciation. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. ED-135 expands WBS as "Wheel Brake System" in the function wording. */
    }
    action def DecelerateTheWheelsOnGearRetraction {
        doc /* Decelerate the wheels on gear retraction. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. */
    }
    action def DecelerateTheWheelsDifferentiallyForDirectionalControl {
        doc /* Decelerate the wheels differentially for directional control. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. */
    }
    action def PreventAirplaneMotionWhenParked {
        doc /* Prevent airplane motion when parked. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. */
    }
    action def ProvideWheelSpeedDataToTheAirplane {
        doc /* Provide wheel speed data to the airplane. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48. Level: system/WBS. */
    }

}
