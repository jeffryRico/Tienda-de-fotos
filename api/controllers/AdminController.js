/**
 * AdminController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

const path = require('path');
const fs = require('fs');

module.exports = {
  inicioSesion: async (peticion, respuesta) => {
    respuesta.view('pages/admin/inicio_sesion');
  },

  procesarInicioSesion: async (peticion, respuesta) => {
    let admin = await Admin.findOne({ email: peticion.body.email, contrasena: peticion.body.contrasena, activo: true});
    if(admin){
      peticion.session.admin = admin;
      peticion.session.cliente = undefined;
      peticion.addFlash('mensaje', 'Sesion de admin iniciada');
      return respuesta.redirect('/admin/principal');
    }
    else {
      peticion.addFlash('mensaje', 'Email o Contraseña invalidos');
      return respuesta.redirect('/admin/inicio-sesion');
    }
  },

  principal: async (peticion, respuesta) => {
    if(!peticion.session || !peticion.session.admin){
      peticion.addFlash('mensaje', 'Sesion invalida');
      return respuesta.redirect('/admin/inicio-sesion');
    }
    let fotos = await Fotos.find().sort('id');
    respuesta.view('pages/admin/principal', { fotos });
  },

  cerrarSesion: async (peticion, respuesta) => {
    peticion.session.admin = undefined;
    peticion.addFlash('mensaje', 'Sesion finalizada');
    return respuesta.redirect('/');
  },

  agregarFoto: async (peticion, respuesta) => {
    respuesta.view('pages/admin/agregar_foto');
  },

  procesarAgregarFoto: async (peticion,respuesta) => {

    let foto = await Fotos.create({
      titulo: peticion.body.titulo,
      activa: true
    }).fetch();

    peticion.file('foto').upload({}, async (error, archivos) => {
      if(archivos && archivos[0]){
        let uploadPath = archivos[0].fd;
        let ext = path.extname(uploadPath);

        await fs.createReadStream(uploadPath).pipe(fs.createWriteStream(path.resolve(sails.config.appPath, `assets/images/fotos/${foto.id}${ext}`)));
        await Fotos.update({ id: foto.id }, { contenido: `${foto.id}${ext}`, activa: true});
        peticion.addFlash('mensaje', 'Foto agregada');
        return respuesta.redirect('/admin/principal');
      }
      peticion.addFlash('mensaje', 'No hay foto seleccionada');
      return respuesta.redirect('/admin/agregar-foto');
    });
  },

  desactivarFoto: async (peticion, respuesta) => {
    await Fotos.update({id: peticion.params.fotoId}, {activa: false});
    peticion.addFlash('mensaje', 'Foto desactivada');
    return respuesta.redirect('/admin/principal');
  },

  activarFoto: async (peticion, respuesta) => {
    await Fotos.update({id: peticion.params.fotoId}, {activa: true});
    peticion.addFlash('mensaje', 'Foto activada');
    return respuesta.redirect('/admin/principal');
  },

  clientes: async (peticion, respuesta) => {
    if(!peticion.session || !peticion.session.admin){
      peticion.addFlash('mensaje', 'Sesion invalida');
      return respuesta.redirect('/admin/inicio-sesion');
    }
    let cliente = await Cliente.find().sort('id');
    respuesta.view('pages/admin/clientes', {cliente});
  },

  ordenesCliente: async (peticion, respuesta) => {
    if(!peticion.session || !peticion.session.admin){
      peticion.addFlash('mensaje', 'Sesion invalida');
      return respuesta.redirect('/admin/inicio-sesion');
    }
    let ordenes = await Orden.find({ cliente: peticion.params.clienteId}).sort('id desc');
    respuesta.view('pages/admin/orden_clientes', {ordenes});
  },

  orden: async (peticion, respuesta) => {
    if(!peticion.session || !peticion.session.admin){
      peticion.addFlash('mensaje', 'Sesion invalida');
      return respuesta.redirect('/admin/inicio-sesion');
    }
    let orden = await Orden.findOne({ id: peticion.params.ordenId }).populate('detalles');

    if (!orden) {
      return respuesta.redirect('/admin/orden_clientes');
    }

    if (orden && orden.detalles == 0) {
      return respuesta.view('pages/admin/ordenes', { orden });
    }

    orden.detalles = await OrdenDetalle.find({ orden: orden.id }).populate('foto');
    return respuesta.view('pages/admin/ordenes', { orden });
  },

  desactivarCliente: async (peticion, respuesta) => {
    await Cliente.update({id: peticion.params.clienteId}, {activo: false});
    peticion.addFlash('mensaje', 'Cliente desactivado');
    return respuesta.redirect('/admin/clientes');
  },

  activarCliente: async (peticion, respuesta) => {
    await Cliente.update({id: peticion.params.clienteId}, {activo: true});
    peticion.addFlash('mensaje', 'Cliente activado');
    return respuesta.redirect('/admin/clientes');
  },

  adminstrador: async (peticion, respuesta) => {
    if(!peticion.session || !peticion.session.admin){
      peticion.addFlash('mensaje', 'Sesion invalida');
      return respuesta.redirect('/admin/inicio-sesion');
    }
    let admins = await Admin.find().sort('id');
    respuesta.view('pages/admin/administradores', {admins});
  },

  desactivarAdmin: async (peticion, respuesta) => {
    if(peticion.params.adminId == peticion.session.admin.id){
      peticion.addFlash('mensaje', 'No puede desactivar su cuenta');
      return respuesta.redirect('/admin/administradores');
    }
    else{
      await Admin.update({id: peticion.params.adminId}, {activo: false});
      peticion.addFlash('mensaje', 'Administrador desactivado');
      return respuesta.redirect('/admin/administradores');
    }
  },

  activarAdmin: async (peticion, respuesta) => {
    await Admin.update({id: peticion.params.adminId}, {activo: true});
    peticion.addFlash('mensaje', 'Administrador activado');
    return respuesta.redirect('/admin/administradores');
  },

  dashboard: async (peticion, respuesta) => {
    if(!peticion.session || !peticion.session.admin){
      peticion.addFlash('mensaje', 'Sesion invalida');
      return respuesta.redirect('/admin/inicio-sesion');
    }
    let cliente = await Cliente.count();
    let foto = await Fotos.count();
    let admins = await Admin.count();
    let orden = await Orden.count();
    return respuesta.view('pages/admin/dashboard', {cliente: cliente, foto: foto, admins: admins, orden: orden});
  },

};

