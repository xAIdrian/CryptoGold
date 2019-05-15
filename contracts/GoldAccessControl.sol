pragma solidity ^0.5.0;

/**
    Our access control determines who is able to modify all of our contracts and alter their state
*/
contract GoldAccessControl {

    /**
        We want to track the new contract when we pause and update
    */
    event ContractUpdated(address newAddress);

    address public ceoAddress;
    address public ctoAddress;

    /// @dev Keeps track whether the contract is paused. When that is true, most actions are blocked
    bool public isPaused = false;

    /// @dev Access modifier for CEO-only functionality
    modifier onlyCEO() {
        require(msg.sender == ceoAddress, "Someone other than the CEO is attempting to alter the contract(s)");
        _;
    }

    modifier onlyCTO() {
        require(msg.sender == ctoAddress, "Someone other than the CTO is attempting to alter the contract(s)");
        _;
    }

    modifier onlyCLevel() {
        require(
            msg.sender == ceoAddress ||
            msg.sender == ctoAddress,
            "Someone other than the CTO or CEO is attempting to alter the contract(s)"
        );
        _;
    }

    /// @dev Assigns a new address to act as the CEO. Only available to the current CEO.
    /// @param _newCEO The address of the new CEO
    function setCEO(address _newCEO) external onlyCEO {
        require(_newCEO != address(0), "Caller address is null or empty");

        ceoAddress = _newCEO;
    }

    /// @dev Assigns a new address to act as the CFO. Only available to the current CEO.
    /// @param _newCFO The address of the new CFO
    function setCTO(address _newCTO) external onlyCEO {
        require(_newCTO != address(0), "Caller address is null or empty");

        ctoAddress = _newCTO;
    }

    /*** Taken from Open-Zeppelin ***/
    event Paused(address account);
    event Resumed(address account);

    /**
     * @return true if the contract is paused, false otherwise.
     */
    function paused() public view returns (bool) {
        return isPaused;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is not paused.
     */
    modifier whenNotPaused() {
        require(!isPaused, "Contract is in an active state and not paused");
        _;
    }

    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     */
    modifier whenPaused() {
        require(isPaused, "Contract is not in the state of Paused");
        _;
    }

    /**
     * @dev called by the owner to pause, triggers stopped state
     */
    function pause() public onlyPauser whenNotPaused {
        isPaused = true;
        emit Paused(msg.sender);
    }

    /**
     * @dev called by the owner to unpause, returns to normal state
     */
    function resume() public onlyPauser whenPaused {
        isPaused = false;
        emit Resumed(msg.sender);
    }
}