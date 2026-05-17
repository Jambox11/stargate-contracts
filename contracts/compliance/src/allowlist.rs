use soroban_sdk::{contracttype, Address};

#[contracttype]
#[derive(Clone)]
pub enum DataKey {
    Admin,
    Allowed(Address),
    Blocked(Address),
    Paused,
}
