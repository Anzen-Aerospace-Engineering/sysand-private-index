package SystemParts {
    
    // Parts
    part def HidraulicSystem {
        part isolationValve [1]; 
    }
    
    part def PowerSource {
        attribute voltage :> SI::V [1];
        attribute current :> SI::A [1];
        attribute power :> SI::W [1];
        port powerSocket : PowerSocket [1];

        ref part wbs : WBS;
    }
    
    part def Aircraft {
        part fuselage [1];
        part wings [2] {
            part flaps [2];
            part spoilers [2];
        }
        part landingGear [2] {
            part wheels [4] {
                part wheelBrake [1];
            }
        }
        part engine [2] {
            part thrustReverser [1];
        }
        part controls {
            part hidraulicSystems [2];
            part brakePedal [1] {
                attribute position [1];
            }
        }
    }
    
    part def FlightCrew;
    part def OtherOccupants;

    // The actual WBS being modelled
    part def WBS {
        port powerSockets : ~PowerSocket [2];
        port powerSocket1 : ~PowerSocket [1] subsets powerSockets;
        port powerSocket2 : ~PowerSocket [1] subsets powerSockets;

        ref part powerSource1 : PowerSource;
        ref part powerSource2 : PowerSource;
        // TODO Add more (see ARP4754B, Fig. E-5)
    }

    // Top-most "container" for everything else
    part System {
        part aircraft : Aircraft;
        part powerSource2 : PowerSource;
        part powerSource1 : PowerSource;
        part wbs : WBS;
    }

    // Ports
    port def PowerSocket {
        out item electricalCurrent;
    }

    // Connections
    interface def PowerFeed {
        end source : PowerSocket;
        end target : ~PowerSocket;
    }

    connection def powerCable1 {
        end part powerSource1 : PowerSource crosses wbs.powerSource1;
        end part wbs : WBS crosses powerSource1.wbs;

        interface : PowerFeed connect powerSource1.powerSocket to wbs.powerSocket1;
    }
    connection def powerCable2 {
        end part powerSource2 : PowerSource crosses wbs.powerSource2;
        end part wbs : WBS crosses powerSource2.wbs;

        interface : PowerFeed connect powerSource2.powerSocket to wbs.powerSocket2;
    }
}
