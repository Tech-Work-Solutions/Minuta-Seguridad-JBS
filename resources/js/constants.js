export const ROLES = {
    GUARDA_SEGURIDAD: "GUARDA DE SEGURIDAD",
    ADMINISTRATIVO: "ADMINISTRATIVO",
    ADMINISTRADOR: "ADMINISTRADOR",
};
  
export const OPCIONES_MENU_GUARDA = ["minuta", "vehiculos", "visitantes"];
  
export const ICONOS_MAP = {
    minuta: "fa-file-signature",
    vehiculos: "fa-car",
    visitantes: "fa-users",
    reportes: "fa-chart-bar",
    configuraciones: "fa-cogs",
    usuarios: "fa-users-cog",
};
  
export const OPCIONES_MENU_ADMIN = [

    { label: "Minuta", route: "/minuta", icon: "fa-file-signature" },
    { label: "Vehiculos", route: "/vehiculos", icon: "fa-car" },
    { label: "Visitantes", route: "/visitantes", icon: "fa-users" },
    { label: "Reportes", route: "/reportes", icon: "fa-chart-bar" },
    { label: "Configuraciones", route: "/configuraciones", icon: "fa-cogs" },
    { label: "Usuarios", route: "/usuarios", icon: "fa-users-cog" },
    { label: "Hoja de vida", route: "/hojadevida", icon: "fa-paperclip" },
];

export const CATEGORIAS_LICENCIA = [{id:1,nombre:"A1"}, {id:2,nombre:"A2"}, {id:3,nombre:"B1"}, {id:4,nombre:"B2"}, {id:5,nombre:"B3"}, {id:6,nombre:"C1"}, {id:7,nombre:"C2"}, {id:8,nombre:"C3"}];