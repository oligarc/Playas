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
  </body>
</html>