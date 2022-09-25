//#use openbsd::pledge::{pledge, pledge_promises, pledge_execpromises};

#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

#[rustler::nif]
fn pledge_promises(s: String) -> bool {
  let result = openbsd::pledge::pledge_promises(s);
  dbg!(result);
  true
}


rustler::init!("Elixir.Openbsd.NIF", [add,pledge_promises]);
