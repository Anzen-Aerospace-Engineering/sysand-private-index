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
}
