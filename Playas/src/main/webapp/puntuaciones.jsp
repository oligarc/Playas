<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<table class="table table-striped text-primary w-50 m-auto">
  <tbody>
      <c:forEach items="${puntuaciones}" var="puntoview">
          <tr>
            <td><img src="img/ImgCaritas/ic_${puntoview.punto}.png" width="20%"></td>
            <td>${puntoview.cuenta}</td>
          </tr>          
      </c:forEach>
  </tbody>
</table>