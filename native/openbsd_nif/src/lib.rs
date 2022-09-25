use rustler::Atom;
use openbsd::pledge::Error::{EFAULT, EINVAL, EPERM};

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
fn pledge_promises(s: String) -> Result<Atom, Atom> {

  return match openbsd::pledge::pledge_promises(s) {
    Err(EFAULT) => Err(atoms::efault()),
    Err(EINVAL) => Err(atoms::einval()),
    Err(EPERM) => Err(atoms::eperm()),
    Err(_) => Err(atoms::error()),
    Ok(()) => Ok(atoms::ok())
  };
}

#[rustler::nif]
fn pledge_execpromises(s: String) -> Result<Atom, Atom> {
  return match openbsd::pledge::pledge_execpromises(s) {
    Err(EFAULT) => Err(atoms::efault()),
    Err(EINVAL) => Err(atoms::einval()),
    Err(EPERM) => Err(atoms::eperm()),
    Err(_) => Err(atoms::error()),
    Ok(()) => Ok(atoms::ok())
  }
}

#[rustler::nif]
fn pledge(promises: String, exec_promises: String) -> Result<Atom, Atom> {
  return match openbsd::pledge::pledge(promises, exec_promises) {
    Err(EFAULT) => Err(atoms::efault()),
    Err(EINVAL) => Err(atoms::einval()),
    Err(EPERM) => Err(atoms::eperm()),
    Err(_) => Err(atoms::error()),
    Ok(()) => Ok(atoms::ok())
  }
}


rustler::init!("Elixir.Openbsd.NIF", [pledge_promises, pledge_execpromises, pledge]);
