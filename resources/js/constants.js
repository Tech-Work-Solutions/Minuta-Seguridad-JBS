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

export const ACTIVIDADES_ECONOMICAS = [
    { label: 'AGRICULTURA', key: 'agricultura' },
    { label: 'GANADERÍA / AVICULTURA', key: 'ganaderia' },
    { label: 'MINERÍA', key: 'mineria' },
    { label: 'HIDROCARBUROS', key: 'hidrocarburos' },
    { label: 'INDUSTRIA', key: 'industria' },
    { label: 'Alimentos y Bebidas', key: 'alimentos' },
    { label: 'Tabaco', key: 'tabaco' },
    { label: 'Textiles y Confecciones', key: 'textiles' },
    { label: 'Cuero y Calzado', key: 'cuerocalzado' },
    { label: 'Papel y Cartón', key: 'papel' },
    { label: 'Editorial y Artes Gráficas', key: 'editorial' },
    { label: 'Químico y Farmacéutico', key: 'quimico' },
    { label: 'Caucho y Plástico', key: 'caucho' },
    { label: 'Vidrio, Cerámica y Cemento', key: 'vidrio' },
    { label: 'Metalurgia', key: 'metalurgia' },
    { label: 'Maquinaria', key: 'maquinaria' },
    { label: 'Automotores', key: 'automotores' },
    { label: 'Muebles', key: 'muebles' },
    { label: 'Reciclaje', key: 'reciclaje' },
    { label: 'ELECTRICIDAD / Gas / Agua', key: 'electricidad' },
    { label: 'CONSTRUCCIÓN', key: 'construccion' },
    { label: 'COMERCIO', key: 'comercio' },
    { label: 'HOTELES Y RESTAURANTES', key: 'hoteles' },
    { label: 'TRANSPORTE Y ALMACENAMIENTO', key: 'transporte' },
    { label: 'COMUNICACIONES', key: 'comunicaciones' },
    { label: 'FINANCIERO', key: 'financiero' },
    { label: 'INMOBILIARIO', key: 'inmobiliario' },
    { label: 'INFORMATICO', key: 'informatico' },
    { label: 'SALUD', key: 'salud' },
    { label: 'EDUCACION', key: 'educacion' },
    { label: 'SEGUROS', key: 'seguros' },
    { label: 'TURISMO / RECREACION', key: 'turismo' },
    { label: 'OTROS SERVICIOS', key: 'otrosServicios' },
    { label: 'Asesorías Profesionales', key: 'asesorias' },
    { label: 'Servicios Temporales', key: 'servicios' },
    { label: 'Seguridad Vigilancia', key: 'seguridad' },
];

export const AREAS_EMPRESA = [
    { label: 'Administración', key: 'administracion' },
    { label: 'Auditoría', key: 'auditoria' },
    { label: 'Bodega', key: 'bodega' },
    { label: 'Compras', key: 'compras' },
    { label: 'Contabilidad', key: 'contabilidad' },
    { label: 'Costos', key: 'costos' },
    { label: 'Crédito y Cobranza', key: 'credito' },
    { label: 'Diseño', key: 'diseño' },
    { label: 'Finanzas', key: 'finanzas' },
    { label: 'Gerencia General', key: 'gerencia' },
    { label: 'Impuestos', key: 'impuestos' },
    { label: 'Mercadeo', key: 'mercadeo' },
    { label: 'Producción', key: 'produccion' },
    { label: 'Publicidad', key: 'publicidad' },
    { label: 'Personal', key: 'personal' },
    { label: 'Sistemas', key: 'sistemas' },
    { label: 'Tesorería', key: 'tesoreria' }
];