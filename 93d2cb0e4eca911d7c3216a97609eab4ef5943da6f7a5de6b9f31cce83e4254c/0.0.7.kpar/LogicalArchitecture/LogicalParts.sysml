package LogicalParts {
    private import SystemParts::WBS;
    private import SystemParts::PowerSocket;
    private import SystemParts::BrakePositionSignalPort;
    private import SystemParts::WheelSpeedDataPort;
    private import SystemParts::WBSStatusDataPort;
    private import SystemParts::NormalBrakeCommandPort;
    private import SystemParts::NormalBrakeControlPort;
    private import SystemParts::AlternateEmergencyBrakeCommandPort;
    private import SystemParts::PowerFeed;

    part wittyMartillo : SystemParts::BrakeSystemControlUnit subsets WBS::brakeSystemControlUnit {
        // Part defs
        abstract part def WittyCANComponent {
            abstract port canPort : CANPort [1..*];
            ref part canConnectedPart : WittyCANComponent [1..*];
        }
        abstract part def WittyPCIeComponent {
            abstract port pciePort : PCIePort [1..*];
            ref part pcieConnectedPart : WittyPCIeComponent [1..*];
        }
        part def WittyComKU specializes WittyCANComponent, WittyPCIeComponent {
            port inPowerSocket : ~PowerSocket [1];
            port brakePositionSignalPort : BrakePositionSignalPort [1];
            port wheelSpeedDataFeeds : WheelSpeedDataPort [8];
            port wbsStatus : WBSStatusDataPort [1];
            port outDataSocket  : WittyDataSocket [1];
            :>> canPort : CANPort [1];
            :>> pciePort : PCIePort [1];
            ref part wittyIO : WittyIO [1];
        }
        part def WittyCore specializes WittyPCIeComponent {
            port inPowerSocket : ~PowerSocket [1];
            port wheelSpeedSensorData : ~WheelSpeedDataPort [8];
            :>> pciePort : PCIePort [1];
        }
        part def WittyIO specializes WittyCANComponent {
            port inPowerSocket : ~PowerSocket [1];
            port inDataSocket  : ~WittyDataSocket [1];
            :>> canPort : CANPort [1];
            ref part wittyComKU : WittyComKU [1];
        }

        // Parts
        part psm {
            abstract port inPowerSockets : ~PowerSocket [2];
            port inPowerSocket1 : ~PowerSocket [1] subsets inPowerSockets;
            port inPowerSocket2 : ~PowerSocket [1] subsets inPowerSockets;
            port outPowerSocket : PowerSocket [1];
            // connection powerCable1 connect [1]  to [1] wbs;
        }
        part psu2 {
            abstract port inPowerSockets : ~PowerSocket [2];
            port inPowerSocket1 : ~PowerSocket [1] subsets inPowerSockets;
            port inPowerSocket2 : ~PowerSocket [1] subsets inPowerSockets;
            port outPowerSocket : PowerSocket [1];
        }
        part wittyPower550 {
            port inPowerSocket : ~PowerSocket [1];
            port outPowerSocket : PowerSocket [1];
        }
        part wittyComKUPart1 : WittyComKU;
        part wittyComKUPart2 : WittyComKU;
        part wittyComVU : WittyPCIeComponent {
            port inPowerSocket : ~PowerSocket [1];
            port inDataSocket  : ~WittyDataSocket [1];
            port wheelSpeedSensorData : ~WheelSpeedDataPort [8];
            :>> pciePort : PCIePort [2];
        }
        part wittyComZU : WittyPCIeComponent {
            port inPowerSocket : ~PowerSocket [1];
            port inDataSocket  : ~WittyDataSocket [1];
            port wheelSpeedSensorData : ~WheelSpeedDataPort [8];
            :>> pciePort : PCIePort [2];
        }
        part wittyCore1 : WittyCore;
        part wittyCore2 : WittyCore;
        part wittyIOPart1 : WittyIO {
            port normalBrakeCommandPort : NormalBrakeCommandPort [1];
            port normalBrakeControlPorts : NormalBrakeControlPort [8];
        }
        part wittyIOPart2 : WittyIO {
            port alternateEmergencyBrakeCommandPorts : AlternateEmergencyBrakeCommandPort [8];
        }

        // Connections and bindings
        connection psmToWittyPower connect [1] psm to [1] wittyPower550 {
            interface : PowerFeed connect psm.outPowerSocket to wittyPower550.inPowerSocket;
        }
        connection wittyPowerToKU1 connect [1] wittyPower550 to [1] wittyComKUPart1 {
            interface : PowerFeed connect wittyPower550.outPowerSocket to wittyComKUPart1.inPowerSocket;
        }
        connection wittyPowerToVU connect [1] wittyPower550 to [1] wittyComVU {
            interface : PowerFeed connect wittyPower550.outPowerSocket to wittyComVU.inPowerSocket;
        }
        connection wittyPowerToWittyCore1 connect [1] wittyPower550 to [1] wittyCore1 {
            interface : PowerFeed connect wittyPower550.outPowerSocket to wittyCore1.inPowerSocket;
        }
        connection wittyPowerToIO1 connect [1] wittyPower550 to [1] wittyIOPart1 {
            interface : PowerFeed connect wittyPower550.outPowerSocket to wittyIOPart1.inPowerSocket;
        }
        connection psu2ToKU2 connect [1] psu2 to [1] wittyComKUPart2 {
            interface : PowerFeed connect psu2.outPowerSocket to wittyComKUPart2.inPowerSocket;
        }
        connection psu2ToZU connect [1] psu2 to [1] wittyComZU {
            interface : PowerFeed connect psu2.outPowerSocket to wittyComZU.inPowerSocket;
        }
        connection psu2ToWittyCore2 connect [1] psu2 to [1] wittyCore2 {
            interface : PowerFeed connect psu2.outPowerSocket to wittyCore2.inPowerSocket;
        }
        connection psu2ToIO2 connect [1] psu2 to [1] wittyIOPart2 {
            interface : PowerFeed connect psu2.outPowerSocket to wittyIOPart2.inPowerSocket;
        }
        connection kU1toIO1 : WittyDataCable connect [1] wittyComKUPart1 to [1] wittyIOPart1;
        connection kU2toIO2 : WittyDataCable connect [1] wittyComKUPart2 to [1] wittyIOPart2;
        connection wittyComKUsCANCable : WittyCANCable connect [1] wittyComKUPart1 to [1] wittyComKUPart2;
        connection wittyIOsCANCable : WittyCANCable connect [1] wittyIOPart1 to [1] wittyIOPart2;
        bind powerSockets = psm.inPowerSockets;
        bind powerSocket1 = psm.inPowerSocket1;
        bind powerSocket2 = psm.inPowerSocket2;
        bind powerSockets = psu2.inPowerSockets;
        bind powerSocket1 = psu2.inPowerSocket1;
        bind powerSocket2 = psu2.inPowerSocket2;
        bind brakePositionNormalPos1Signal = wittyComKUPart1.brakePositionSignalPort;
        bind brakePositionNormalPos2Signal = wittyComKUPart2.brakePositionSignalPort;
        bind wittyComKUPart1.wheelSpeedDataFeeds = wheelSpeedDataFeeds;
        // bind wittyComKUPart2.wheelSpeedDataFeeds = wheelSpeedDataFeeds; // Cannot bind 16 to 8, right?
        bind wittyComKUPart1.wbsStatus = wbsStatus;
        // bind wittyComKUPart2.wbsStatus = wbsStatus; // Same as above, binding 2 to 1
        bind wheelSpeedSensorData = wittyComVU.wheelSpeedSensorData;
        bind wheelSpeedSensorData = wittyComZU.wheelSpeedSensorData;
        bind wheelSpeedSensorData = wittyCore1.wheelSpeedSensorData;
        bind wheelSpeedSensorData = wittyCore2.wheelSpeedSensorData;
        bind wittyIOPart1.normalBrakeCommandPort = normalBrakeCommandPort;
        bind wittyIOPart1.normalBrakeControlPorts = normalBrakeControlPorts;
        bind wittyIOPart2.alternateEmergencyBrakeCommandPorts = alternateEmergencyBrakeCommandPorts;

        // Port defs
        port def WittyDataSocket {
            out item data;
        }
        port def CANPort {
            inout item canData;
        }
        port def PCIePort {
            inout item pcieData;
        }

        // Interface defs
        interface def WittyDataBus {
            end port source : WittyDataSocket [1];
            end port target : ~WittyDataSocket [1];
        }
        interface def CANBus {
            end port end1 : CANPort [1];
            end port end2 : CANPort [1];
        }
        interface def PCIeBus {
            end port end1 : PCIePort [1];
            end port end2 : PCIePort [1];
        }

        // Connection defs
        connection def WittyDataCable {
            end part wittyComKU : WittyComKU [1] crosses wittyIO.wittyComKU;
            end part wittyIO : WittyIO [1] crosses wittyComKU.wittyIO;
            interface : WittyDataBus connect wittyComKU.outDataSocket to wittyIO.inDataSocket;
        }
        connection def WittyCANCable {
            end part end1 : WittyCANComponent [1] crosses end2.canConnectedPart;
            end part end2 : WittyCANComponent [1] crosses end1.canConnectedPart;
            interface : CANBus connect end1.canPort to end2.canPort;
        }
        connection def WittyPCIeCable {
            end part end1 : WittyCANComponent [1] crosses end2.canConnectedPart;
            end part end2 : WittyCANComponent [1] crosses end1.canConnectedPart;
            interface : CANBus connect end1.canPort to end2.canPort;
        }

    }
}
