/**
 * SesionController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

module.exports = {

  registro: async (peticion, respuesta) => {
    respuesta.view('pages/registro');
  },

  procesarRegistro: async (peticion, respuesta) => {
    let cliente = await Cliente.findOne({ email: peticion.body.email });
    if(cliente) {
      peticion.addFlash('mensaje', 'Email duplicado');
      return respuesta.redirect('/registro');
    }
    else {
      let cliente = await Cliente.create({
        email: peticion.body.email,
        nombre: peticion.body.nombre,
        contrasena: peticion.body.contrasena
      });
      peticion.session.cliente = cliente;
      peticion.addFlash('mensaje', 'Cliente Registrado');
      return respuesta.redirect('/');
    }
  },

  inicioSesion: async (peticion, respuesta) => {
    respuesta.view('pages/inicio_sesion');
  },

  procesarInicioSesion: async (peticion, respuesta) => {
    let cliente = await Cliente.findOne({ email: peticion.body.email, contrasena: peticion.body.contrasena, activo: true});
    if(cliente) {
      peticion.session.cliente = cliente;
      let carroCompra = await CarroCompra.find({cliente: cliente.id});
      peticion.session.carroCompra = carroCompra;
      peticion.addFlash('mensaje', 'Sesion iniciada');
      return respuesta.redirect('/');
    }
    else {
      peticion.addFlash('mensaje', 'Email o contraseña invalidos');
      return respuesta.redirect('/inicio-sesion');
    }
  },

  cerrarSesion: async (peticion, respuesta) => {
    peticion.session.cliente= undefined;
    peticion.addFlash('mensaje', 'Sesion finalizada');
    return respuesta.redirect('/');
  }

};

