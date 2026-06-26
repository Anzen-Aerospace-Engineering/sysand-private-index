package SystemRequirements {

    requirement aircraftLevelWheelBrakeRequirements {
        doc /* Aircraft-level WBS-related requirements captured from ED-79B Appendix E, Table E-4, pages E-13 to E-14. */
        subject aircraft : SystemParts::Aircraft;

        requirement <'S18-ACFT-R-1000'> decelerateOnGroundCapability {
            doc /* The S18 airplane shall have a means to decelerate on ground. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-13. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-1100'> decelerateWheelsOnGroundCapability {
            doc /* The S18 airplane shall have a means to decelerate the wheels on ground. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-13. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-1110'> pilotControlledWheelBrakingCapability {
            doc /* The S18 airplane shall have pilot-controlled wheel braking capability. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-13. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-1120'> autobrakingCapabilityDuringLandingAndRto {
            doc /* The S18 airplane shall have an autobraking capability during landing and RTO. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-13. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-1130'> antiSkidBrakingCapability {
            doc /* The S18 airplane shall have anti-skid braking. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-13. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-1140'> wheelBrakeSystemStatusInterface {
            doc /* The S18 airplane shall provide interface for Wheel Brake System status and annunciations. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-13. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-0181'> decelerateWheelsOnGearRetraction {
            doc /* The S18 airplane shall decelerate the wheels on gear retraction. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-13. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-0182'> differentialWheelDecelerationCapability {
            doc /* The S18 airplane shall be capable of decelerating the wheels differentially. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-14. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-0183'> parkingBrakeCapability {
            doc /* The S18 airplane shall have a parking brake to prevent airplane motion on the ground. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-14. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-0184'> hydraulicallyDrivenBrakingCapability {
            doc /* The S18 airplane shall have hydraulically driven braking. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-14. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-0185'> autobrakeOverrideCapability {
            doc /* The S18 airplane shall have an autobrake override that can be initiated by the flight crew. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-14. Level: aircraft. */
        }

        requirement <'S18-ACFT-R-0186'> atmosphericRadiationSafetyCapability {
            doc /* The S18 airplane shall meet safety requirements while operating in an average atmospheric radiation environment per the IEC 62396 standard with an altitude of 40000 feet and a latitude of 45 degrees. */
            comment /* Source: ED-79B Appendix E, Table E-4, page E-14. Level: aircraft. */
        }
    }

    requirement wheelBrakeSystemLevelRequirements {
        doc /* System-level WBS requirements captured from ED-79B Appendix E, Table E-19, pages E-42 to E-48. Safety-derived rows are corroborated by ED-135 Appendix Q, Tables Q.6-4 and Q.6-5, pages Q-79 to Q-80, when explicitly identified there. */
        subject wbs : SystemParts::WBS;

        requirement <'S18-WBS-R-0020'> decelerateWheelsOnGroundMeans {
            doc /* The Wheel Brake System shall have a means to decelerate the wheels on the ground. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-42. Level: system. Traced from: S18-ACFT-R-1100. */
        }

        requirement <'S18-WBS-R-0021'> landingDecelerationPerformance {
            doc /* The Wheel Brake System shall be capable of decelerating the S18 airplane to a complete stop/to taxi speed in 2000 feet when wheel brakes, high lift speed brakes and reverse thrust are available, including when at maximum landing weight. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-42. Level: system. Traced from: Derived, S18 Airplane Trade Study. */
        }

        requirement <'S18-WBS-R-0041'> directionalControlByDifferentialBraking {
            doc /* The Wheel Brake System shall provide directional control on ground by a differential braking function. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-42. Level: system. Traced from: S18-ACFT-R-0182. */
        }

        requirement <'S18-WBS-R-0042'> parkingBrakeProvision {
            doc /* The Wheel Brake System shall provide a parking brake to prevent airplane motion on the ground. */
            comment /* Source: ED-79B Appendix E, Table E-19, pages E-42 to E-43. Level: system. Traced from: S18-ACFT-R-0183. */
        }

        requirement <'S18-WBS-R-0043'> autobrakingProvision {
            doc /* The Wheel Brake System shall provide autobraking capability during landing and RTO. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: S18-ACFT-R-1120. */
        }

        requirement <'S18-WBS-R-0044'> antiSkidProvision {
            doc /* The Wheel Brake System shall provide anti-skid braking. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: S18-ACFT-R-1130. */
        }

        requirement <'S18-WBS-R-0045'> hydraulicBrakeControlProvision {
            doc /* The Wheel Brake System shall provide hydraulic brake control. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: S18-ACFT-R-0184. */
        }

        requirement <'S18-WBS-R-0046'> flightCrewAutobrakeOverride {
            doc /* The Wheel Brake System shall override the autobrake when the commanded by the flight crew. */
            comment /* Source: ED-79B Appendix E, Table E-19, pages E-43 to E-44. Level: system. Traced from: S18-ACFT-R-0185. */
        }

        requirement <'S18-WBS-R-0047'> atmosphericRadiationEnvironmentCompliance {
            doc /* The Wheel Brake System shall meet safety requirements while operating in an average atmospheric radiation environment per the IEC 62396 standard with an altitude of 40000 feet and a latitude of 45 degrees. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: S18-ACFT-R-0186. */
        }

        requirement <'S18-WBS-R-0049'> bscuControlledAndMonitoredArchitecture {
            doc /* The Wheel Brake System shall be controlled and monitored by a computer system called Brake System Control Unit. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: Derived design decision. */
        }

        requirement <'S18-WBS-R-0050'> separateHydraulicPowerSupplyLinesPerWheelBrake {
            doc /* Each wheel brake shall have separate hydraulic power supply lines. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-0052'> hydraulicCircuitValveAndFuseProvision {
            doc /* Each hydraulic Wheel Brake System circuit shall have meter valves, anti-skid valves and hydraulic fuses. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-0055'> antiSkidPressureReductionBehavior {
            doc /* Anti-skid system shall be capable to prevent skidding of the tires by reducing the pressure applied to the brakes. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-0062'> emergencyAccumulatorProvision {
            doc /* The Wheel Brake System shall include an emergency accumulator to supply hydraulic power to the wheel brakes. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-43. Level: system. Traced from: S18-ACFT-R-1551. */
        }

        requirement <'S18-WBS-R-0065'> emergencyAccumulatorMinimumPressure {
            doc /* The emergency accumulator shall provide a minimum of 1800 psi. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-44. Level: system. Traced from: Derived design architecture decision. Note: page E-82 records correction from an earlier 2000 psi wording. */
        }

        requirement <'S18-WBS-R-0066'> wheelBrakeFunctionFdala {
            doc /* The Wheel Brake System decelerate the wheels on the ground function shall be developed as FDAL A. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-44. Level: system. Traced from: S18-ACFT-R-0933. */
        }

        requirement <'S18-WBS-R-0100'> alternateEmergencyEquipmentInstallation {
            doc /* The Alternate/Emergency Brake System hydraulic equipment and piping shall be installed aft of the engine 1 UERF trajectory envelope. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-44. Level: system. Traced from: S18-ACFT-R-1552. */
        }

        requirement <'S18-WBS-R-0120'> noSingleHydraulicFailureAcrossBothBrakeSystems {
            doc /* No single failure or event shall cause the complete loss of hydraulic power for both the WBS Normal and Alternate/Emergency Brake Systems. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-44. Level: system. Traced from: S18-ACFT-R-1550. Corroborated by ED-135 Appendix Q, Table Q.6-4, page Q-79. */
        }

        requirement <'S18-WBS-R-0130'> noSingleElectricalFailureAcrossBothBrakeSystems {
            doc /* No single failure or event shall cause the complete loss of electrical power for both the WBS Normal and Alternate/Emergency Brake Systems. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-44. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-4, page Q-79. */
        }

        requirement <'S18-WBS-R-0150'> completeLossProbabilityOnLanding {
            doc /* Complete loss of decelerate the wheels on the ground function shall be less probable than 1.0E-07 for a landing. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-44. Level: system. Traced from: S18-ACFT-R-1385. */
        }

        requirement <'S18-WBS-R-0200'> redundantControlLanesToAlternateEmergencyMeterValves {
            doc /* Two redundant control lanes shall be provided between the EBU and each of the two Alternate/Emergency Meter Valves. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-44. Level: system. Traced from: S18-ACFT-R-1600. */
        }

        requirement <'S18-WBS-R-0326'> noSingleFailureInadvertentAllWheelBrakingOnTakeoffRoll {
            doc /* No single failure shall result in inadvertent wheel braking of all wheels during take-off roll. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-44. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-4, page Q-79. */
        }

        requirement <'S18-WBS-R-0508'> twoIndependentHydraulicPressureSources {
            doc /* The Wheel Brake System shall have at least two independent hydraulic pressure sources. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-45. Level: system. Traced from: Derived, Coord Memo S18a-CM00XX. */
        }

        requirement <'S18-WBS-R-0509'> dualBscuCommandFunctions {
            doc /* The Wheel Brake System shall have dual BSCU command functions. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-45. Level: system. Traced from: Derived, Coord Memo S18a-CM00XX. */
        }

        requirement <'S18-WBS-R-0510'> noRudderOrNoseWheelSteeringFunctionInWbs {
            doc /* The rudder and nose wheel steering functions shall not be implemented by the Wheel Brake System. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-45. Level: system. Traced from: Derived, Coord Memo S18a-CM00XX. */
        }

        requirement <'S18-WBS-R-0631'> individualBrakeTemperatureIndication {
            doc /* The Wheel Brake System shall indicate individual brake temperature. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-45. Level: system. Traced from: Derived, 14 CFR/CS 25.735(j). */
        }

        requirement <'S18-WBS-R-0632'> individualBrakePressureControl {
            doc /* The Wheel Brake System shall control individual brake pressure. */
            comment /* Source: ED-79B Appendix E, Table E-19, pages E-45 to E-46. Level: system. Traced from: Derived, 14 CFR/CS 25.735(j). */
        }

        requirement <'S18-WBS-R-1613'> hydraulicPressureControlPerBrakeForceAnalysis {
            doc /* Hydraulic pressure shall be controlled for weight, autobrake mode, ground speed, wheel rotation, brake temperature and deceleration rate in accordance with graphs given in S18 brake force analysis AAS18-XXX. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-45. Level: system. Traced from: Derived, S18 brake force analysis AAS18-XXX. */
        }

        requirement <'S18-WBS-R-2971'> oneNormalOperatingMode {
            doc /* Wheel Brake System shall have one NORMAL operating mode. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-45. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-2972'> oneAlternateOperatingMode {
            doc /* Wheel Brake System shall have one ALTERNATE operating mode. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-45. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-2973'> precludeAlternateEmergencyOperationDuringNormalUse {
            doc /* Operation of the Alternate/Emergency Brake System shall be precluded when the Normal Brake System is in use. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-45. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-2974'> emergencyModeHydraulicPowerFromAccumulator {
            doc /* An emergency accumulator shall provide hydraulic power for EMERGENCY Wheel Brake System operating mode. */
            comment /* Source: ED-79B Appendix E, Table E-19, pages E-45 to E-46. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-2975'> emergencyAccumulatorAttachedToHyd2Line {
            doc /* The emergency accumulator shall be attached to the HYD 2 hydraulic line between the Selector Valve and the Alternate/Emergency Meter Valve. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-2986'> bscuWheelBrakeCommandFunctionFdala {
            doc /* The wheel brake command function of the BSCU shall be developed as FDAL A. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-5, page Q-79. */
        }

        requirement <'S18-WBS-R-2997'> twoIndependentBscuCommandChannels {
            doc /* The BSCU shall have two independent command channels. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-2999'> twoIndependentBscuElectricalPowerSources {
            doc /* The BSCU shall have two independent electrical power sources. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: S18-WBS-R-0130. */
        }

        requirement <'S18-WBS-R-3011'> brakePedalsIndependentFromRudderControl {
            doc /* Brake pedals shall be independent from the rudder control. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-3213'> normalBrakeSystemPoweredFromHyd1 {
            doc /* Normal Brake System shall be powered from the airplane's HYD 1 hydraulic system. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-3224'> alternateEmergencyBrakeSystemPoweredFromHyd2 {
            doc /* Alternate/Emergency Brake System shall be powered from the airplane's HYD 2 hydraulic system. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-3245'> automaticAlternateModeSelectionAfterNormalFailure {
            doc /* ALTERNATE Mode shall automatically be selected when the NORMAL Mode fails. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: Derived design architecture decision. */
        }

        requirement <'S18-WBS-R-6104'> bscuLossOfValidCommandProbabilityLimit {
            doc /* The probability of BSCU failure resulting in loss of a valid braking command output to the NMV shall not exceed 2.0E-04 per flight. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-46. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-5, page Q-79. */
        }

        requirement <'S18-WBS-R-6105'> bscuUnannunciatedErroneousCommandProbabilityLimit {
            doc /* The probability of BSCU failure resulting in unannunciated erroneous braking command to the NMV shall not exceed 2.0E-04 per flight. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-47. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-5, page Q-79. */
        }

        requirement <'S18-WBS-R-6106'> bscuLossOfSovOpenCommandProbabilityLimit {
            doc /* The probability of BSCU failure resulting in the loss of command to open the SOV shall not exceed 2.0E-04 per flight. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-47. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-5, page Q-79. */
        }

        requirement <'S18-WBS-R-6107'> bscuUnintendedShutoffValveClosureProbabilityLimit {
            doc /* The probability of BSCU failure resulting in unintended closure of the S/ASV shall not exceed 2.0E-04 per flight. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-47. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-5, pages Q-79 to Q-80. */
        }

        requirement <'S18-WBS-R-6108'> bscuCommandsAvailableAfterSingleElectricalPowerLoss {
            doc /* The SOV and NMV commands shall be provided by the BSCU upon loss of either airplane electrical power input. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-47. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-4, page Q-79. */
        }

        requirement <'S18-WBS-R-6109'> hyd1EnableDisablesAltEmerCtrl {
            doc /* When "HYD 1 Enable" output is enabled, then "Alt/Emer Ctrl" output shall be disabled. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-47. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-4, page Q-79. */
        }

        requirement <'S18-WBS-R-6110'> noSingleFailureErroneousNmvCommandAndSovInhibit {
            doc /* No single failure shall cause erroneous NMV command and inhibit the SOV function. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-47. Level: system. Traced from: Derived, S18 WBS PSSA. Corroborated by ED-135 Appendix Q, Table Q.6-4, page Q-79. */
        }

        requirement <'S18-WBS-R-6111'> normalBrakeHydraulicComponentLossProbabilityLimit {
            doc /* The probability of "Loss of Normal Brake System Hydraulic Components" shall be less than 3.3E-05 per flight. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-47. Level: system. Traced from: Derived, S18 WBS PSSA. */
        }

        requirement <'S18-WBS-R-6112'> alternateEmergencyHydraulicComponentLossProbabilityLimit {
            doc /* The probability of "Loss of Alternate/Emergency Brake System Hydraulic Components" shall be less than 3.3E-05 per flight. */
            comment /* Source: ED-79B Appendix E, Table E-19, page E-47. Level: system. Traced from: Derived, S18 WBS PSSA. */
        }
    }
}
