const usuariosPrellenados = [
    {
        nombre: "Madai",
        apellidoPaterno: "Valle",
        apellidoMaterno: "Chávez",
        email: "20233tn133@utez.edu.mx",
        password: "password123",
        matricula: "20233tn133",
        descripcion: "Estudiante de DSM"
    },
    {
        nombre: "Ximena",
        apellidoPaterno: "Flores",
        apellidoMaterno: "Soto",
        email: "20233tn142@utez.edu.mx",
        password: "password456",
        matricula: "20233tn142",
        descripcion: "Estudiante de DSM"
    }
];

document.addEventListener("DOMContentLoaded", function() {
    const tablaUsuarios = document.getElementById("tablaUsuarios");

  
    

    function cargarUsuarios() {
        usuariosPrellenados.forEach(usuario => {
            agregarUsuarioATabla(usuario);
        });
    }
    

    function agregarUsuarioATabla(usuario) {
        const nuevaFila = document.createElement("tr");

        Object.values(usuario).forEach(valor => {
            const celda = document.createElement("td");
            celda.textContent = valor;
            nuevaFila.appendChild(celda);
        });
    
        let usuariosRegistrados = [];

        function usuarioRegistrado() {
            let nuevoUsuario = {
                nombre: "Ximena",
                apellidoPaterno: "Flores",
                apellidoMaterno: "Soto",
                email: "20233tn142@utez.edu.mx",
                password: "password456",
                matricula: "20233tn142",
                descripcion: "Estudiante de DSM"
            };
        
            usuariosRegistrados.push(nuevoUsuario);
        }
        
        


        // Llamar a la función para agregar el usuario
        usuarioRegistrado();
        
        console.log(usuariosRegistrados);
        

        const modificarBtn = document.createElement("button");
        modificarBtn.textContent = "Modificar";
        modificarBtn.classList.add("btn", "btn-warning", "modificar");
        modificarBtn.addEventListener("click", function() {
            modificarUsuario(usuario);
        });

        const eliminarBtn = document.createElement("button");
        eliminarBtn.textContent = "Eliminar";
        eliminarBtn.classList.add("btn", "btn-danger", "eliminar");
        eliminarBtn.addEventListener("click", function() {
            eliminarUsuario(nuevaFila);
        });

        const modificarCelda = document.createElement("td");
        modificarCelda.appendChild(modificarBtn);
        nuevaFila.appendChild(modificarCelda);

        const eliminarCelda = document.createElement("td");
        eliminarCelda.appendChild(eliminarBtn);
        nuevaFila.appendChild(eliminarCelda);

        tablaUsuarios.appendChild(nuevaFila);
    }

    function eliminarUsuario(fila) {
        tablaUsuarios.removeChild(fila);
    }

    function modificarUsuario(usuario) {
        window.location.href = "registrarUsuario.html?" + new URLSearchParams(usuario).toString();
    }

    cargarUsuarios();
});

function usuarioRegistrado() {
    let nuevoUsuario = {
        nombre: document.getElementById("nombre").values,
        apellidoPaterno: document.getElementById("apellidoPaterno").values,
        apellidoMaterno: document.getElementById("apellidoMaterno").values,
        email: document.getElementById("email").values,
        password: document.getElementById("password").values,
        matricula: document.getElementById("matricula").values,
        descripcion: document.getElementById("descripcion").values
    };

    usuariosPrellenados.push(nuevoUsuario);
}

document.getElementById("boton").addEventListener("click",usuarioRegistrado());
