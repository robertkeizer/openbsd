use rustler::Atom;

//#use openbsd::pledge::{pledge, pledge_promises, pledge_execpromises};

mod atoms {
  rustler::atoms! {
    ok,
    error
  }
}

#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

#[rustler::nif]
fn pledge_promises(s: String) -> Result<Atom, Atom> {
  let result = match openbsd::pledge::pledge_promises(s) {
    Ok(()) => Ok(atoms::ok()),
    Err(foo) => {
      dbg!(foo);
      return Err(atoms::error());
    }
  };

  dbg!(result);

  return result;
}


rustler::init!("Elixir.Openbsd.NIF", [add,pledge_promises]);
