package SystemStates {

    state def SystemStateMachine {
        entry;
        then ground::taxi;
        state ground {
            state taxi;
            then takeOff;
            state takeOff;
            then air::climb;
            state landing;
        }
        state air {
            state climb;
            then cruise;
            state cruise;
            then descent;
            state descent;
            then approach;
            state approach;
            then ground::landing;
        }
        transition landingToEnd
            first ground::landing
            then done;
    }

    state def WBSModeStateMachine {
        doc /* The WBS includes a Normal Brake System and Alternate/Emergency Brake System which operate in NORMAL, ALTERNATE, or EMERGENCY Modes. */
        comment /* Source: ED-79B Appendix E, Section E.4.3 and Figure E-6, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-4, page Q-64. Level: system/WBS operating modes. */

        entry;
        then normalMode;

        state normalMode {
            doc /* NORMAL Mode is operated with BSCU and HYD 1 hydraulic system. NORMAL Mode includes either autobrake or manual braking. Autobrake is only available in the NORMAL Mode. */
            comment /* Source: ED-79B Appendix E, Section E.4.3, pages E-24 to E-25; ED-135 Appendix Q, Figure Q.6-4, page Q-64. Level: system/WBS operating mode. */
        }

        state alternateMode {
            doc /* ALTERNATE Mode is on standby and is selected automatically when the Normal Brake System fails. It is operated with HYD 2 hydraulic system. */
            comment /* Source: ED-79B Appendix E, Section E.4.3, page E-24; ED-135 Appendix Q, Figure Q.6-4, page Q-64. Level: system/WBS operating mode. */
        }

        state emergencyMode {
            doc /* EMERGENCY Mode is selected when the Normal Brake System has failed and HYD 2 hydraulic system is lost. It is operated with an emergency hydraulic accumulator. */
            comment /* Source: ED-79B Appendix E, Section E.4.3, page E-25; ED-135 Appendix Q, Figure Q.6-4, page Q-64. Level: system/WBS operating mode. */
        }

        comment /* Transition source: ED-135 Appendix Q, Figure Q.6-4, page Q-64. Cause: HYD 1 pressure below threshold value (loss of HYD 1 supply or removed by BSCU), or manual selection. */
        transition normalToAlternate
            first normalMode
            then alternateMode;

        comment /* Transition source: ED-135 Appendix Q, Figure Q.6-4, page Q-64. Cause: HYD 2 pressure below threshold value. */
        transition alternateToEmergency
            first alternateMode
            then emergencyMode;
    }
}
