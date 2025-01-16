<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Playas</title>

    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  </head>

  <body>
    <header>
      <div class="container">
        <div
          class="row justify-content-between w-100 align-items-center mb-4 p-4"
        >
          <div class="col text-start" >
            <img src="img/logo (1).png" alt="" style="width: 35%" />
          </div>
          <div class="col d-flex justify-content-end align-items-center gap-3">
            <form action="ControllerAdmin?operacion=seleccionCCAA" method="post">
              <select name="ccaa" id="ccaa" onchange="this.form.submit()">
              <option value="" ${comunidad == null ? 'selected' : ''}>Selecciona CCAA</option>
                <c:forEach items="${listaCcaa}" var="ccaa">
                <option value="${ccaa.id}" ${ccaa.id == comunidad.id ? 'selected' : ''}>${ccaa.nombre}</option>
                </c:forEach>
              </select>
              </form>
              <form action="ControllerAdmin?operacion=seleccionProvincia" method="post">
              <select name="provincia" id="provincia" onchange="this.form.submit()">
              <option value="" ${comunidad == null ? 'selected' : ''}>Selecciona Provincia</option>
              <c:if test="${comunidad != null}">
              <c:forEach items="${comunidad.provincias}" var="prov">
                <option value="${prov.id}" ${prov.id == provincia.id ? 'selected' : ''}>${prov.nombre}</option>
                </c:forEach>
                </c:if>
              </select>
              </form>
              <form action="ControllerAdmin?operacion=seleccionMunicipio" method="post">
              <select name="municipio" id="municipio" onchange="this.form.submit()" >
              <option value="" ${provincia == null ? "selected" : ""}>Selecciona Municipio</option>
              <c:if test="${provincia != null}">
              <c:forEach items="${provincia.municipios}" var="muni" >
                <option value="${muni.id}" ${muni.id == municipio.id ? 'selected' : ''}>${muni.nombre}</option>
                </c:forEach>
                </c:if>
              </select>
              </form>
          </div>
          <div class="col text-end">
  			<button class="btn btn-primary" onclick="#">Login</button>
			</div>
        </div>
      </div>
    </header>
    <main class="mb-4">
      <div class="container">
        <div class="row justify-content-center">
        <c:if test="${municipio != null}">
        <c:forEach items="${municipio.playas}" var="playa">
          <div class="col-sm-12 col-md-4 col-lg-3 mb-3">
            <div class="card h-100">
              <img class="card-img-top" src="img/ImgPlayas/${playa.id}_${playa.images[0].id}.jpg" alt="Title" />
              <div class="card-body">
                <h4 class="card-title">${playa.nombre}</h4>
                <p class="card-text">${playa.descripcion}</p>
                <div class="d-flex justify-content-between align-items-center">
                  <a href="#" class="text-decoration-none" 
   					data-bs-toggle="modal" 
   					data-bs-target="#infoModal"
   					onclick="setPlayaInfo('${playa.nombre}', '${playa.puntos}')">
                    <i class="bi bi-info-circle"></i>
                  </a>
                  <a href="#" class="text-decoration-none">
                    <i class="bi bi-star"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
          </c:forEach>
          </c:if>
        </div>
      </div>
    </main>
    <footer class="bg-primary p-4">
      <div class="container">
        <h1 class="text-center text-white">Playitas</h1>
      </div>
    </footer>
    
    
    <div class="modal fade" id="modallogin" tabindex="-1" aria-labelledby="staticBackdrop" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-sm">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Login & Register</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
              </div>
              <form action="ControllerAdmin?operacion=login" method="post">
              	<div class="modal-body">
                    <div class="mb-3">
                        <label for="" class="form-label">Email</label>
                        <input type="text" class="form-control" name="email">
                    </div>
                    <div class="mb-3">
                        <label for="" class="form-label">Password</label>
                        <input type="password" class="form-control" name="clave">
                    </div>
              	</div>
                <div class="modal-footer" >
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Login & Register</button>
                </div>
              </form> 
            </div>
          </div>
        </div>
    
    <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="infoModalLabel">Calificación de la playa</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <h5 id="playaName"></h5> <!-- Aquí va el nombre de la playa con la función del script -->
        <table class="table">
          <thead>
            <tr>
            </tr>
          </thead>
          <tbody id="puntosList">
            
            <tr class="table-light">
              <td><img src="img/ImgCaritas/ic_1.png" alt="Punto 1" width="50" height="50" /></td>
              <td id="voto1"></td>
            </tr>
            <tr class="table-dark">
              <td><img src="img/ImgCaritas/ic_2.png" alt="Punto 2" width="50" height="50" /></td>
              <td id="voto2"></td> 
            </tr>
            <tr class="table-light">
              <td><img src="img/ImgCaritas/ic_3.png" alt="Punto 3" width="50" height="50" /></td>
              <td id="voto3"></td>
            </tr>
            <tr class="table-dark">
              <td><img src="img/ImgCaritas/ic_4.png" alt="Punto 4" width="50" height="50" /></td>
              <td id="voto4"></td>
            </tr>
            <tr class="table-light">
              <td><img src="img/ImgCaritas/ic_5.png" alt="Punto 5" width="50" height="50" /></td>
              <td id="voto5"></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
      crossorigin="anonymous"
    ></script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
      integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
      crossorigin="anonymous"
    ></script>
    
    <script>
 function setPlayaInfo(nombre, puntos) {
     console.log(puntos); 
     console.log("tipo de puntos" + typeof puntos); //Llega como un string el cabrón
     document.getElementById("playaName").textContent = nombre;
     let puntosArray = JSON.parse(puntos);
     let votos = [0, 0, 0, 0, 0]; 
     puntosArray.forEach(puntoObj => {
         console.log(puntoObj.puntos); 
         
         
             const punto = puntoObj.puntos; 
             
             if (punto >= 0 && punto < 2) {
                 votos[0] += 1;  // 0-2
             } else if (punto >= 2 && punto < 4) {
                 votos[1] += 1;  // 2-4
             } else if (punto >= 4 && punto < 6) {
                 votos[2] += 1;  // 4-6
             } else if (punto >= 6 && punto < 8) {
                 votos[3] += 1;  // 6-8
             } else if (punto >= 8 && punto <= 10) {
                 votos[4] += 1;  // 8-10
             }
     });

     // Mostrar los resultados
     document.getElementById("voto1").textContent = `Votos: ${votos[0]}`;
     document.getElementById("voto2").textContent = `Votos: ${votos[1]}`;
     document.getElementById("voto3").textContent = `Votos: ${votos[2]}`;
     document.getElementById("voto4").textContent = `Votos: ${votos[3]}`;
     document.getElementById("voto5").textContent = `Votos: ${votos[4]}`;
 }
</script>
    

    
  </body>
</html>