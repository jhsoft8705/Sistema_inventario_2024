 document.addEventListener("DOMContentLoaded", function() {
    function loadScript(src, callback) {
        var script = document.createElement('script');
        script.src = src;
        script.async = true;
        script.onload = callback;
        document.head.appendChild(script);
    }

    // Condiciones para cargar los scripts
    if (document.querySelectorAll("[toast-list]").length > 0 ||
        document.querySelectorAll("[data-choices]").length > 0 ||
        document.querySelectorAll("[data-provider]").length > 0) {
        
        // Cargar Toastify.js
        loadScript('https://cdn.jsdelivr.net/npm/toastify-js', function() {
            console.log('Toastify.js loaded');
            // Puedes inicializar Toastify aquí si es necesario
        });

        // Cargar Choices.js
        loadScript('../../assets/libs/choices.js/public/assets/scripts/choices.min.js', function() {
            console.log('Choices.js loaded');
            // Puedes inicializar Choices.js aquí si es necesario
        });

        // Cargar Flatpickr
        loadScript('../../assets/libs/flatpickr/flatpickr.min.js', function() {
            console.log('Flatpickr loaded');
            // Puedes inicializar Flatpickr aquí si es necesario
        });
    }
});
 