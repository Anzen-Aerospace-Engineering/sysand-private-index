package SystemParts {
    
    // Part defs
    part def HydraulicSystem {
        doc /* HYD 1 and HYD 2 provide hydraulic power to the WBS. */
        comment /* Source: ED-79B Appendix E, Section E.4.3, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: aircraft/system support. */

        port hydraulicSocket : HydraulicSocket [1];

        ref part wbs : WBS;
    }
    
    part def PowerSource {
        doc /* The WBS uses redundant electrical buses such that no single electrical bus loss results in loss of the WBS. */
        comment /* Source: ED-79B Appendix E, Section E.3.7.1, page E-19; ED-79B Appendix E, Table E-17, page E-40; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: aircraft/system support. */

        attribute voltage subsets SI::V [1];
        attribute current subsets SI::A [1];
        attribute power subsets SI::W [1];
        port powerSocket : PowerSocket [1];

        ref part wbs : WBS;
    }

    part def BrakeSystemControlUnit {
        doc /* The WBS shall be controlled and monitored by a computer system called the Brake System Control Unit (BSCU). */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-30; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */

        port brakeActuatorControlPorts : BrakeActuatorControlPort [8];
    }

    part def BrakeActuator {
        doc /* The BSCU shall transmit the following to the brake actuator: Total commanded clamping force. The brake actuator shall transmit the following information to the BSCU: Total measured clamping force. Brake actuator power valid status. Brake temperature. Wheel speed. */
        comment /* Source: ED-79B Appendix E, Table E-18, page E-41. Level: system/WBS intra-system interface endpoint. */

        port brakeActuatorControlPort : ~BrakeActuatorControlPort [1];

        ref part bscu : BrakeSystemControlUnit;
    }

    part def NormalBrakeSystem {
        doc /* The WBS includes a Normal Brake System and Alternate/Emergency Brake System which operate in NORMAL, ALTERNATE, or EMERGENCY Modes. */
        comment /* Source: ED-79B Appendix E, Section E.4.3, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */
    }

    part def AlternateEmergencyBrakeSystem {
        doc /* The WBS includes a Normal Brake System and Alternate/Emergency Brake System which operate in NORMAL, ALTERNATE, or EMERGENCY Modes. */
        comment /* Source: ED-79B Appendix E, Section E.4.3, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */
    }

    part def ShutoffValve {
        doc /* The Shutoff Valve (SOV) responds to commands from the BSCU to apply hydraulic pressure to the brake discs. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-30; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */
    }

    part def SelectorValve {
        doc /* The Selector Valve connects the HYD 2 supply to the Alternate/Emergency Brake System and removes the HYD 1 supply to the Normal Brake System when the HYD 1 pressure falls below a threshold value, either from loss of HYD 1 supply itself or from its removal by the BSCU due to the presence of faults. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-30; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */
    }

    part def NormalMeterValve {
        doc /* The function of the NMVs is to control pressure in the Normal Brake System to the demanded level and to provide regulation for the anti-skid function while the WBS is in the NORMAL Mode. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-30; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */
    }

    part def EmergencyAccumulator {
        doc /* The Emergency Accumulator provides an emergency reserve of hydraulic pressure for the Alternate/Emergency Brake System. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, pages E-30 to E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */
    }

    part def AlternateEmergencyMeterValve {
        doc /* The function of the Alternate/Emergency Meter Valve is to control pressure in the Alternate/Emergency Brake System to the level demanded by the brake pedals while the WBS is in the ALTERNATE or EMERGENCY Modes. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */
    }

    part def ShutoffAntiSkidValve {
        doc /* Shutoff/Anti-Skid Valves follow BSCU commands to control hydraulic pressure to the brake pads in the Alternate/Emergency Brake System. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */
    }

    part def ElectricBrakeUnit {
        doc /* The EBU provides the mechanical interface to the flight crew and electrical interface to the WBS. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS external interface. Figure Q.6-3 identifies the Electric Brake Unit as not part of WBS. */
    }

    part def WheelBrake {
        doc /* The wheel brakes will provide friction force to the wheel. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Section Q.6.2.1.3, page Q-62. Level: system/WBS associated brake equipment. */

        port hydraulicSocket : ~HydraulicSocket [1];

        part actuator : BrakeActuator [1];
        ref part wbs : WBS;
    }

    part def ParkingBrake {
        doc /* The parking brake handle is used to set the parking brake system. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Section Q.6.2.1.2.2, page Q-60. Level: system/WBS architecture. */
    }

    part def WheelSpeedSensor {
        doc /* A wheel speed sensor is used to sense wheel speed on each wheel. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS architecture. */

        port wheelSpeedDataSocket : WheelSpeedDataPort [1];

        ref part wbs : WBS;
    }

    part def Wheel {
        doc /* The S18 airplane has two main landing gear struts with four wheels on each strut for a total of eight wheels. Each wheel is equipped with an independent brake. */
        comment /* Source: ED-135 Appendix Q, Section Q.5.3, page Q-48; ED-79B Appendix E, Section E.4.6.1, page E-31. Level: aircraft/WBS associated equipment. */

        part wheelBrake : WheelBrake [1];
        part wheelSpeedSensor : WheelSpeedSensor [1];
    }
    
    part def Aircraft {
        doc /* The S18 airplane has two main landing gear attached to the wings and a nose gear. The WBS is installed on the two main landing gear. */
        comment /* Source: ED-79B Appendix E, Section E.4.3, page E-24; ED-135 Appendix Q, Section Q.6.2.1.3, page Q-62. Level: aircraft. */

        part fuselage [1];
        part wings [2] {
            part flaps [2];
            part spoilers [2];
        }
        part landingGear [2] {
            part wheels : Wheel [4];
        }
        part engine [2] {
            part thrustReverser [1];
        }
        part controls {
            abstract part hydraulicSystems : HydraulicSystem [2];
            part normalHydraulicSystem : HydraulicSystem [1] subsets hydraulicSystems;
            part altEmerHydraulicSystem : HydraulicSystem [1] subsets hydraulicSystems;
            part brakePedal [1] {
                attribute position [1];
            }
            part electricBrakeUnit : ElectricBrakeUnit;

        }
        abstract part powerSources : PowerSource [2];
        part powerSource1 : PowerSource subsets powerSources;
        part powerSource2 : PowerSource subsets powerSources;
        part wbs : WBS;

        connection powerCable1 : PowerCable1 connect [1] powerSource1 to [1] wbs;
        connection powerCable2 : PowerCable2 connect [1] powerSource2 to [1] wbs;
        connection hydraulicNormalInputHose : HydraulicNormalInputHose connect [1] controls.normalHydraulicSystem to [1] wbs;
        connection hydraulicAltEmerInputHose : HydraulicAltEmerInputHose connect [1] controls.altEmerHydraulicSystem to [1] wbs;
        connection hydraulicNormalOutputHose : HydraulicNormalOutputHose connect [1] wbs to [8] landingGear.wheels;
        connection hydraulicAltEmerOutputHose : HydraulicAltEmerOutputHose connect [1] wbs to [8] landingGear.wheels;
        connection measuredWheelSpeedDataCable : MeasuredWheelSpeedDataCable connect [8] landingGear.wheels.wheelSpeedSensor to [1] wbs;
    }

    // The actual WBS being modelled
    part def WBS {
        doc /* The S18 WBS controls airplane speed through deceleration when on the ground and interfaces with hydraulic, electrical, pilot control, display, and wheel-speed data sources. */
        comment /* Source: ED-79B Appendix E, Sections E.4.3 and E.4.6.6.1, pages E-24 to E-25 and E-39 to E-40; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system/WBS. */

        abstract port powerSockets : ~PowerSocket [2];
        port powerSocket1 : ~PowerSocket [1] subsets powerSockets;
        port powerSocket2 : ~PowerSocket [1] subsets powerSockets;
        port wheelSpeedSensorData : ~WheelSpeedDataPort [8];
        port wheelSpeedDataFeeds : WheelSpeedDataPort [8];
        port status : WBSStatusDataPort [1];
        abstract port hydraulicInputSockets : ~HydraulicSocket [2];
        port normalHydraulicInputSocket : ~HydraulicSocket [1] subsets hydraulicInputSockets;
        port altEmerHydraulicInputSocket : ~HydraulicSocket [1] subsets hydraulicInputSockets;
        abstract port hydraulicOutputSockets : HydraulicSocket [2];
        port normalHydraulicOutputSocket : HydraulicSocket [1] subsets hydraulicOutputSockets;
        port altEmerHydraulicOutputSocket : HydraulicSocket [1] subsets hydraulicOutputSockets;
        abstract port brakePositionSignals : BrakePositionSignalPort [4];
        abstract port brakePositionNormalSignals : BrakePositionSignalPort [2] subsets brakePositionSignals;
        abstract port brakePositionAltEmerSignals : BrakePositionSignalPort [2] subsets brakePositionSignals;
        port brakePositionNormalPos1Signal : BrakePositionSignalPort [1] subsets brakePositionNormalSignals;
        port brakePositionNormalPos2Signal : BrakePositionSignalPort [1] subsets brakePositionNormalSignals;
        port brakePositionAltEmerPos1Signal : BrakePositionSignalPort [1] subsets brakePositionAltEmerSignals;
        port brakePositionAltEmerPos2Signal : BrakePositionSignalPort [1] subsets brakePositionAltEmerSignals;

        ref part powerSource1 : PowerSource [1];
        ref part powerSource2 : PowerSource [1];
        ref part electricBrakeUnit : ElectricBrakeUnit [1];
        ref part wheels : Wheel [8];
        ref part normalHydraulicSystem : HydraulicSystem [1];
        ref part altEmerHydraulicSystem : HydraulicSystem [1];

        part brakeSystemControlUnit : BrakeSystemControlUnit [1];
        part normalBrakeSystem : NormalBrakeSystem [1] {
            comment /* To be extended with ref parts */
        }
        part alternateEmergencyBrakeSystem : AlternateEmergencyBrakeSystem [1] {
            comment /* To be extended with ref parts */
        }
        part shutoffValve : ShutoffValve [1];
        part selectorValve : SelectorValve [1];
        part normalMeterValves : NormalMeterValve [8];
        part emergencyAccumulator : EmergencyAccumulator [1];
        part alternateEmergencyMeterValves : AlternateEmergencyMeterValve [2];
        part shutoffAntiSkidValves : ShutoffAntiSkidValve [8];
        part parkingBrake : ParkingBrake [1];

        connection brakeActuatorControlFeeds : BrakeActuatorControlFeed connect [1] brakeSystemControlUnit to [8] wheels.wheelBrake.actuator;
    }

    // Items
    item def FlightCrew;
    item def OtherOccupants;

    item def ElectricalCurrent {
        doc /* Electrical power input to the WBS. */
        comment /* Source: ED-79B Appendix E, Table E-17, page E-40; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system interface item. */

        attribute current redefines ISQ::electricCurrent;
    }
    item def HydraulicFluid {
        doc /* Hydraulic power supplied to the WBS and wheel brakes. */
        comment /* Source: ED-79B Appendix E, Section E.4.3, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system interface item. */

        attribute pressure redefines ISQ::pressure;
    }
    item def WheelSpeedData {
        doc /* Wheel speed data to the airplane. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Table Q.5-1, page Q-48 and Figure Q.6-3, page Q-63. Level: system interface item. */

        attribute speed redefines ISQ::speed;
    }
    item def WBSStatusData {
        doc /* WBS status data output. */
        comment /* Source: ED-79B Appendix E, Table E-17, page E-40; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system interface item. */

        attribute wbsStatus;
    }
    item def BrakePositionSignal {
        doc /* Brake pedal position and alternate electrical brake signals provided to the WBS. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system interface item. */

        attribute position;
    }
    item def TotalCommandedClampingForce {
        doc /* Total commanded clamping force. */
        comment /* Source: ED-79B Appendix E, Table E-18, page E-41. Level: system intra-system interface item. */

        attribute force redefines ISQ::force;
    }
    item def TotalMeasuredClampingForce {
        doc /* Total measured clamping force. */
        comment /* Source: ED-79B Appendix E, Table E-18, page E-41. Level: system intra-system interface item. */

        attribute force redefines ISQ::force;
    }
    item def BrakeActuatorPowerValidStatus {
        doc /* Brake actuator power valid status. */
        comment /* Source: ED-79B Appendix E, Table E-18, page E-41. Level: system intra-system interface item. */

        attribute status;
    }
    item def BrakeTemperature {
        doc /* Brake temperature. */
        comment /* Source: ED-79B Appendix E, Table E-18, page E-41; ED-79B Appendix E, Section E.4.6.1, page E-31. Level: system intra-system interface item. */

        attribute temperature redefines ISQ::temperature;
    }

    // Ports
    port def PowerSocket {
        doc /* Electrical power interface socket. */
        comment /* Source: ED-79B Appendix E, Table E-17, page E-40; ED-135 Appendix Q, Figure Q.6-3, page Q-63. */
        out item electricalCurrent : ElectricalCurrent;
    }
    port def HydraulicSocket {
        doc /* Hydraulic power interface socket. */
        comment /* Source: ED-79B Appendix E, Section E.4.3, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-3, page Q-63. */
        out item hydraulicFluid : HydraulicFluid;
    }
    port def WheelSpeedDataPort {
        doc /* Wheel-speed data interface port. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25; ED-135 Appendix Q, Figure Q.6-3, page Q-63. */
        out item wheelSpeedData : WheelSpeedData;
    }
    port def WBSStatusDataPort {
        doc /* WBS status data interface port. */
        comment /* Source: ED-79B Appendix E, Table E-17, page E-40; ED-135 Appendix Q, Figure Q.6-3, page Q-63. */
        out item wbsStatusData : WBSStatusData;
    }
    port def BrakePositionSignalPort {
        doc /* Brake pedal position and alternate electrical brake signal input port. */
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. */
        in item brakePositionSignal : BrakePositionSignal;
    }
    port def BrakeActuatorControlPort {
        doc /* Brake actuator command and feedback control port. */
        comment /* Source: ED-79B Appendix E, Table E-18, page E-41. */
        out item totalCommandedClampingForce : TotalCommandedClampingForce;
        in item totalMeasuredClampingForce : TotalMeasuredClampingForce;
        in item brakeActuatorPowerValidStatus : BrakeActuatorPowerValidStatus;
        in item brakeTemperature : BrakeTemperature;
        in item wheelSpeedData : WheelSpeedData;
    }

    // Top-most "container" for everything else
    part system {
        part aircraft : Aircraft;
        item flightCrew : FlightCrew;
        item otherOccupants : OtherOccupants;
    }

    // Connections
    interface def PowerFeed {
        doc /* Electrical power feed to the WBS. */
        comment /* Source: ED-79B Appendix E, Table E-17, page E-40; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system interface. */

        end source : PowerSocket;
        end target : ~PowerSocket;

        flow of ElectricalCurrent from source.electricalCurrent to target.electricalCurrent;
    }
    connection def PowerCable1 {
        comment /* Source: ED-135 Appendix Q, Figure Q.6-3, page Q-63. Represents PWR 1 input to WBS. */
        end part powerSource : PowerSource crosses wbs.powerSource1;
        end part wbs : WBS crosses powerSource.wbs;

        interface : PowerFeed connect powerSource.powerSocket to wbs.powerSocket1;
    }
    connection def PowerCable2 {
        comment /* Source: ED-135 Appendix Q, Figure Q.6-3, page Q-63. Represents PWR 2 input to WBS. */
        end part powerSource : PowerSource crosses wbs.powerSource2;
        end part wbs : WBS crosses powerSource.wbs;

        interface : PowerFeed connect powerSource.powerSocket to wbs.powerSocket2;
    }

    interface def HydraulicFeed {
        doc /* Hydraulic feed between hydraulic systems, the WBS, and wheel brakes. */
        comment /* Source: ED-79B Appendix E, Section E.4.3, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system interface. */

        end source : HydraulicSocket;
        end target : ~HydraulicSocket;

        flow of HydraulicFluid from source.hydraulicFluid to target.hydraulicFluid;
    }
    connection def HydraulicNormalInputHose {
        comment /* Source: ED-79B Appendix E, Section E.4.3, page E-24; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Represents HYD 1 input for NORMAL Mode. */
        end part hydraulicSystem : HydraulicSystem crosses wbs.normalHydraulicSystem;
        end part wbs : WBS crosses hydraulicSystem.wbs;

        interface : HydraulicFeed connect hydraulicSystem.hydraulicSocket to wbs.normalHydraulicInputSocket;
    }
    connection def HydraulicAltEmerInputHose {
        comment /* Source: ED-79B Appendix E, Section E.4.3, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Represents HYD 2 input for ALTERNATE Mode. */
        end part hydraulicSystem : HydraulicSystem crosses wbs.altEmerHydraulicSystem;
        end part wbs : WBS crosses hydraulicSystem.wbs;

        interface : HydraulicFeed connect hydraulicSystem.hydraulicSocket to wbs.altEmerHydraulicInputSocket;
    }
    connection def HydraulicNormalOutputHose {
        comment /* Source: ED-79B Appendix E, Section E.4.6.1.2, page E-34; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Represents normal hydraulic output to wheel brakes. */
        comment /* Cannot use cross features for the wheelBrake since they cannot be chained, e.g. `crosses wbs.wheels.wheelBrake` */
        end part wbs : WBS crosses wheelBrake.wbs;
        end part wheelBrake : WheelBrake;

        interface : HydraulicFeed connect wbs.normalHydraulicOutputSocket to wheelBrake.hydraulicSocket;
    }
    connection def HydraulicAltEmerOutputHose {
        comment /* Source: ED-79B Appendix E, Section E.4.6.1.2, page E-34; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Represents alternate/emergency hydraulic output to wheel brakes. */
        comment /* Cannot use cross features for the wheelBrake since they cannot be chained, e.g. `crosses wbs.wheels.wheelBrake` */
        end part wbs : WBS crosses wheelBrake.wbs;
        end part wheelBrake : WheelBrake;

        interface : HydraulicFeed connect wbs.altEmerHydraulicOutputSocket to wheelBrake.hydraulicSocket;
    }

    interface def WheelSpeedDataFeed {
        doc /* Wheel speed data feed from wheel speed sensors to the WBS. */
        comment /* Source: ED-79B Appendix E, Section E.4.4, page E-25 and Section E.4.6.1, page E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Level: system interface. */

        end source : WheelSpeedDataPort;
        end target : ~WheelSpeedDataPort;

        flow of WheelSpeedData from source.wheelSpeedData to target.wheelSpeedData;
    }
    connection def MeasuredWheelSpeedDataCable {
        comment /* Source: ED-79B Appendix E, Section E.4.6.1, page E-31; ED-135 Appendix Q, Figure Q.6-3, page Q-63. Represents measured wheel speed data from wheel speed sensors to WBS. */
        comment /* Cannot use cross features for the wheelSpeedSensor since they cannot be chained, e.g. `crosses wbs.wheels.wheelSpeedSensor` */
        end part wheelSpeedSensor : WheelSpeedSensor;
        end part wbs : WBS crosses wheelSpeedSensor.wbs;

        interface : WheelSpeedDataFeed connect wheelSpeedSensor.wheelSpeedDataSocket to wbs.wheelSpeedDataFeeds;
    }

    interface def BrakeActuatorControl {
        doc /* Brake actuator command and feedback control interface. */
        comment /* Source: ED-79B Appendix E, Table E-18, page E-41. Level: system intra-system interface. */

        end source : BrakeActuatorControlPort;
        end target : ~BrakeActuatorControlPort;

        flow of TotalCommandedClampingForce from source.totalCommandedClampingForce to target.totalCommandedClampingForce;
        flow of TotalMeasuredClampingForce from target.totalMeasuredClampingForce to source.totalMeasuredClampingForce;
        flow of BrakeActuatorPowerValidStatus from target.brakeActuatorPowerValidStatus to source.brakeActuatorPowerValidStatus;
        flow of BrakeTemperature from target.brakeTemperature to source.brakeTemperature;
        flow of WheelSpeedData from target.wheelSpeedData to source.wheelSpeedData;
    }
    connection def BrakeActuatorControlFeed {
        doc /* Brake actuator control feed between the BSCU and brake actuators. */
        comment /* Source: ED-79B Appendix E, Table E-18, page E-41. Level: system intra-system interface. */
        comment /* Cannot use nested cross features. */
        end part bscu : BrakeSystemControlUnit crosses brakeActuator.bscu;
        end part brakeActuator : BrakeActuator;

        interface : BrakeActuatorControl connect bscu.brakeActuatorControlPorts to brakeActuator.brakeActuatorControlPort;
    }
}
