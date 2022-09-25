use rustler::Atom;

//#use openbsd::pledge::{pledge, pledge_promises, pledge_execpromises};

mod atoms {
  rustler::atoms! {
    ok,
    error,
    efault,
    einval,
    eperm
  }
}

#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

#[rustler::nif]
fn pledge_promises(s: String) -> Result<Atom, Atom> {

  return match openbsd::pledge::pledge_promises(s) {
    Err(openbsd::pledge::Error::EFAULT) => Err(atoms::efault()),
    Err(openbsd::pledge::Error::EINVAL) => Err(atoms::einval()),
    Err(openbsd::pledge::Error::EPERM) => Err(atoms::eperm()),
    Err(_) => Err(atoms::error()),
    Ok(()) => Ok(atoms::ok())
  };
}


rustler::init!("Elixir.Openbsd.NIF", [add,pledge_promises]);
