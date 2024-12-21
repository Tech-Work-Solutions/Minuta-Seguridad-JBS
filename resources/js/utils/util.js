export const getGeolocation = () => {
    return new Promise((resolve, reject) => {
        if ('geolocation' in navigator) {
            navigator.geolocation.getCurrentPosition(
                (position) => {
                    const latitud = position.coords.latitude;
                    const longitud = position.coords.longitude;
                    resolve({ latitud, longitud });
                },
                (error) => {
                    let errorMessage = '';
                    switch (error.code) {
                        case error.PERMISSION_DENIED:
                            errorMessage = 'El usuario denegó el acceso a la ubicación.';
                            break;
                        case error.POSITION_UNAVAILABLE:
                            errorMessage = 'La información de ubicación no está disponible.';
                            break;
                        case error.TIMEOUT:
                            errorMessage = 'La solicitud para obtener la ubicación expiró.';
                            break;
                        default:
                            errorMessage = 'Ocurrió un error desconocido.';
                            break;
                    }
                    reject(new Error(errorMessage));
                },
                {
                    enableHighAccuracy: true,
                    timeout: 10000,
                    maximumAge: 0,
                }
            );
        } else {
            reject(new Error('La geolocalización no es soportada por este navegador.'));
        }
    });
}