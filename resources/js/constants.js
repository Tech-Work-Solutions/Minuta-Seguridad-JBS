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